
<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <form v-on:submit.prevent="createPositivo()">
          <div class="form-group">
            <label for="nombre" class="bmd-label-floating">Nombre:</label>
            <input
              type="text"
              class="form-control"
              name="nombre"
              id="nombre"
              v-model.trim="positivo.nombre"
              autocomplete="off"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-raised btn-primary" type="submit" id="envioneu">
              <i class="fa fa-plus-circle"></i> Agregar
            </button>
          </div>
        </form>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="panel panel-success panel_estilo_persona">
          <div class="panel-body div1 table-responsive">
            <table
              class="table table-bordered table-hover table-fixed table-striped"
              style="background:white;"
            >
              <thead>
                <tr>
                  <th>#</th>
                  <th>Nombre</th>
                  <th>Fecha registro</th>
                  <th>Acción</th>
                </tr>
              </thead>
              <tbody>
                <template v-if="lista!=''">
                  <tr v-for="(list,index) in lista">
                    <td>{{index+1}}</td>
                    <td>{{list.nombre}}</td>
                    <td>{{format_date(list.tiempo_registro)}}</td>
                    <td align="center">
                      <button
                        type="button"
                        class="btn btn-raised btn-primary"
                        v-on:click.prevent="infopersona(list)"
                      >
                        <i class="fa fa-pencil"></i>
                      </button>
                      <button
                        type="button"
                        class="btn btn-raised btn-danger"
                        v-on:click.prevent="deletepersona(list)"
                      >
                        <i class="fa fa-trash"></i>
                      </button>
                    </td>
                  </tr>
                </template>
                <template v-else>
                  <tr>
                    <td colspan="5" align="center">No hay resultados disponibles</td>
                  </tr>
                </template>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div id="myModalNeutro" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Editar:</h4>
          </div>
          <div class="modal-body">
            <form v-on:submit.prevent="editPositivo(positivo.id)">
              <div class="form-group">
                <label for="nombre_edit">Nombre:</label>
                <input
                  type="text"
                  class="form-control"
                  id="nombre_edit"
                  v-model="positivo.nombre_edit"
                />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import swal from "sweetalert";
import moment from "moment";
import "moment/locale/es";
moment.locale("es");
var crf_tok = document.querySelector('input[name="csrfmiddlewaretoken"]').value;
var config = {
  headers: { "X-CSRFToken": crf_tok }
};
export default {
  created() {
    this.getPositivo();
  },
  data() {
    return {
      positivo: {
        nombre: "",
        id: "",
        nombre_edit: ""
      },
      lista: []
    };
  },
  methods: {
    mensaje(titulo, texto, icono) {
      swal({
        icon: icono,
        title: titulo,
        text: texto,
        button: true,
        timer: 1500
      });
    },
    format_date(fecha) {
      return moment(fecha).format("LLLL");
    },
    disabl(valor) {
      $("#envioneu").prop("disabled", valor);
    },
    limpiar() {
      this.positivo.nombre = "";
      this.positivo.nombre_edit = "";
    },
    getPositivo() {
      axios
        .get("/api/neutro/")
        .then(response => {
          this.lista = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
    infopersona(info) {
      this.positivo.nombre_edit = info.nombre;
      this.positivo.id = info.id;
      $("#myModalNeutro").modal("show");
    },
    editPositivo(info) {
      //var selfx = this;
      let url_edit = "http://127.0.0.1:8000/persona/editneutro/" + info + "/";
      var dataedit = {
        nombre: this.positivo.nombre_edit
      };
      axios
        .patch(url_edit, dataedit, config)
        .then(response => {
          this.mensaje(response.data.message, "", "success");
          this.getPositivo();
          this.limpiar();
          $("#myModalNeutro").modal("hide");
        })
        .catch(error => {
          console.log(error);
        });
    },
    deletepersona(info) {
      let url_delete = "http://127.0.0.1:8000/persona/deleteneutro/" + info.id;
      var selfdel = this;
      swal({
        title: "Estas seguro?",
        text: "Eliminara a " + info.nombre,
        icon: "warning",
        buttons: true,
        dangerMode: true
      }).then(willDelete => {
        if (willDelete) {
          axios
            .delete(url_delete, config)
            .then(response => {
              selfdel.mensaje("Excelente", response.data.message, "success");
              selfdel.getPositivo();
            })
            .catch(error => {
              console.log(error);
            });
        } else {
          console.log("");
        }
      });
    },
    createPositivo() {
      var crf_token = document.querySelector(
        'input[name="csrfmiddlewaretoken"]'
      ).value;
      var data = {
        nombre: this.positivo.nombre
      };
      var sel_thi = this;
      sel_thi.disabl(true);
      setTimeout(function() {
        sel_thi.disabl(false);
      }, 2000);
      axios
        .post("http://127.0.0.1:8000/persona/addneutro", data, config)
        .then(response => {
          if (response.data.success) {
            this.mensaje(response.data.success, "", "success");
            this.getPositivo();
            this.limpiar();
          } else if (response.data.fail) {
            this.mensaje(response.data.fail, "", "error");
            this.limpiar();
          }
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
<style scoped>
.table-bordered,
.table-bordered > tbody > tr > td,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > td,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > thead > tr > th {
  border: 1px solid #afa8a8;
}

.panel.panel-success.panel_estilo_persona {
  border: 1px solid #2a3f54;
  -webkit-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
  box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
  width: 80%;
  margin: auto;
}

td.nombre_link a {
  color: #2a3f54;
}

.div1 {
  overflow-y: scroll;
  height: 400px;
  width: 100%;
  background: #ecf0f5;
}

.div1 table {
  width: 100%;
}

thead {
  background: #2a3f54;
  color: white;
}
</style>