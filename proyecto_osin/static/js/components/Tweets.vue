<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        Para buscar latitud y longitud ir a cualquiera de los siguientes links:
        <br />
        <br />
        <p>
          <a href="https://www.latlong.net/" target="_blank">Latitud y longitud</a>
        </p>
        <p>
          <a href="https://www.google.com.pe/maps/" target="_blank">Google Maps</a>
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
          <label for="palabra" class="bmd-label-floating">Palabra:</label>
          <input
            type="text"
            class="form-control"
            name="palabra"
            id="palabra"
            v-model="palabra"
            autocomplete="off"
          />
        </div>
        <div class="form-group">
          <label for="geocoder" class="bmd-label-floating">Latitud y longitud:</label>
          <input
            type="text"
            class="form-control"
            name="geocoder"
            id="geocoder"
            v-model="geocoder"
            autocomplete="off"
          />
        </div>
        <div class="form-group">
          <label for="kilometro" class="bmd-label-floating">Km:</label>
          <input
            type="text"
            class="form-control"
            name="kilometro"
            id="kilometro"
            v-model="kilometro"
            autocomplete="off"
          />
        </div>
        <div class="form-group">
          <label for="f_inicio" class="bmd-label-floating">Fecha Inicio:</label>
          <input type="date" class="form-control" name="f_inicio" id="f_inicio" v-model="f_inicio" />
        </div>
        <div class="form-group">
          <label for="f_inicio" class="bmd-label-floating">Fecha Fin:</label>
          <input type="date" class="form-control" name="f_fin" id="f_fin" v-model="f_fin" />
        </div>
        <div class="form-group">
          <button class="btn btn-raised btn-primary" type="button" v-on:click.prevent="getocial()">
            <i class="fa fa-search"></i> Buscar
          </button>
        </div>
        <div class="form-group" v-show="loading">
          <i class="fa fa-spinner fa-spin" style="font-size:48px"></i> Cargando....
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="panel panel-success panel_estilo">
          <div class="panel-body div1 table-responsive">
            <table
              class="table table-bordered table-hover table-fixed table-striped"
              style="background:white;"
            >
              <thead>
                <tr>
                  <th>#</th>
                  <th>Datos</th>
                </tr>
              </thead>
              <tbody>
                <template v-if="listaTweet!=''">
                  <tr v-for="(list,index) in listaTweet">
                    <td>{{list.id_str}}</td>
                    <td>
                      <table class="table table-bordered">
                        <tr>
                          <td rowspan="6" class="estilo_wi_rows">
                            <img :src="list.user.profile_image_url_https" />
                          </td>
                          <td class="nombre_info">{{list.user.name}}</td>
                        </tr>
                        <tr>
                          <td class>{{list.full_text}}</td>
                        </tr>
                        <tr>
                          <td class="nombre_link">
                            <a
                              :href="list.user.screen_name"
                              target="_blank"
                            >Usuario: {{"https://twitter.com/"+list.user.screen_name}}</a>
                          </td>
                        </tr>
                        <tr>
                          <td class="nombre_info">Dirección: {{list.user.location}}</td>
                        </tr>
                        <tr>
                          <td class="nombre_info">Descripción: {{list.user.description}}</td>
                        </tr>
                        <tr>
                          <td
                            class="nombre_info"
                          >Fecha de creación: {{format_date(list.created_at)}}</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </template>
                <template v-else>
                  <tr>
                    <td colspan="3" align="center">No hay resultados disponibles</td>
                  </tr>
                </template>
              </tbody>
            </table>
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
var tokent = document.querySelector('input[name="csrfmiddlewaretoken"]').value;
var config = {
  headers: { "X-CSRFToken": tokent }
};

var config2 = {
  headers: {
    "Access-Control-Allow-Origin": "http://127.0.0.1:8000",
    "Access-Control-Allow-Methods": "GET,PUT,POST,DELETE,OPTIONS",
    "Access-Control-Allow-Headers":
      '"Origin, X-Requested-With, Content-Type, Accept"',
    "Content-Type": "application/json",
    crossdomain: true
  }
};

export default {
  created() {
    // this.getocial();
  },
  data() {
    return {
      listaTweet: [],
      geocoder: "",
      palabra: "",
      kilometro: "",
      f_inicio: "",
      f_fin: "",
      loading: false
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
    getocial() {
      let geocoder = this.geocoder;
      let kilometro = this.kilometro;
      let palabra = this.palabra;
      let f_inicio = this.f_inicio;
      let f_fin = this.f_fin;
      this.loading = true;
      axios
        .get(
          "http://127.0.0.1:8000/search/getsocial",
          {
            params: {
              geocoder: geocoder,
              kilometro: kilometro,
              palabra: palabra,
              f_inicio: f_inicio,
              f_fin: f_fin
            }
          },
          config2
        )
        .then(response => {
          console.log(response);
          this.listaTweet = response.data;
          this.loading = false;
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

.panel.panel-success.panel_estilo {
  border: 1px solid #2a3f54;
  -webkit-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
  box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
  width: 80%;
  margin: auto;
}

table.table.table-bordered.tablita {
  box-shadow: 0px 2px 8px 3px rgba(0, 0, 0, 0.75);
}

td.estilo_wi_rows {
  width: 124px;
}

td.nombre_info {
  color: black;
  font-size: 15px;
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

td.info_style {
  background: #15202a;
  color: white;
}

thead {
  background: #2a3f54;
  color: white;
}
</style>