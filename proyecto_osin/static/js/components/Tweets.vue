<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat">
          Para buscar latitud y longitud ir a cualquiera de los siguientes
          enlaces:
        </p>

        <p class="text-lat">
          <a href="https://www.latlong.net/" target="_blank"
            >Latitud y longitud</a
          >
        </p>
        <p class="text-lat">
          <a href="https://www.google.com.pe/maps/" target="_blank"
            >Google Maps</a
          >
        </p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
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
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <div class="form-group">
          <label for="geocoder" class="bmd-label-floating"
            >Latitud y longitud:</label
          >
          <input
            type="text"
            class="form-control"
            name="geocoder"
            id="geocoder"
            v-model="geocoder"
            autocomplete="off"
          />
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
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
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        <p class="text-lat">
          Ingrese los datos para la gráfica de análisis de sentimiento
        </p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="great" class="bmd-label-floating">Muy bueno:</label>
          <input
            type="text"
            class="form-control"
            name="great"
            id="great"
            v-model="great"
            autocomplete="off"
          />
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="good" class="bmd-label-floating">Bueno:</label>
          <input
            type="text"
            class="form-control"
            name="good"
            id="good"
            v-model="good"
            autocomplete="off"
          />
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="neutro" class="bmd-label-floating">Neutro:</label>
          <input
            type="text"
            class="form-control"
            name="neutral"
            id="neutral"
            v-model="neutral"
            autocomplete="off"
          />
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="bad" class="bmd-label-floating">Malo:</label>
          <input
            type="text"
            class="form-control"
            name="bad"
            id="bad"
            v-model="bad"
            autocomplete="off"
          />
        </div>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
        <div class="form-group">
          <label for="bad" class="bmd-label-floating">Muy Malo:</label>
          <input
            type="text"
            class="form-control"
            name="terrible"
            id="terrible"
            v-model="terrible"
            autocomplete="off"
          />
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        <div class="form-group">
          <button
            class="btn btn-raised btn-primary"
            type="button"
            v-on:click.prevent="getocial()"
          >
            <i class="fa fa-search"></i> Buscar
          </button>
        </div>
        <div class="form-group" v-show="loading">
          <i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
          Cargando....
        </div>
      </div>
    </div>
    <br /><br />
    <!-- <div class="form-group">
          <label for="f_inicio" class="bmd-label-floating">Fecha Inicio:</label>
          <input
            type="date"
            class="form-control"
            name="f_inicio"
            id="f_inicio"
            v-model="f_inicio"
          />
        </div>
        <div class="form-group">
          <label for="f_inicio" class="bmd-label-floating">Fecha Fin:</label>
          <input
            type="date"
            class="form-control"
            name="f_fin"
            id="f_fin"
            v-model="f_fin"
          />
        </div> -->

    <div class="row well">
      <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
        <p>TWEETS</p>
        <br />
        <template v-if="listaTweet.CountTwets">
          <p>{{ listaTweet.CountTwets }}</p>
        </template>
        <template v-else>0</template>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
        <p>TIMEFRAME</p>
        <br />
        <template v-if="listaTweet.timeframes">
          <p>{{ listaTweet.timeframes }}</p>
        </template>
        <template v-else>0</template>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
        <p>TOTAL RT'S</p>
        <br />
        <template v-if="listaTweet.retweetsCount">
          <p>{{ listaTweet.retweetsCount }}</p>
        </template>
        <template v-else>0</template>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
        <p>TOTAL FAVES</p>
        <br />
        <template v-if="listaTweet.favCount">
          <p>{{ listaTweet.favCount }}</p>
        </template>
        <template v-else>0</template>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
        <p>REPLIES</p>
        <br />
        <template v-if="listaTweet.repliesCount">
          <p>{{ listaTweet.repliesCount }}</p>
        </template>
        <template v-else>0</template>
      </div>
      <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
    </div>
    <br /><br /><br />
    <div class="row">
      <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <p class="text-lat text-center">Análisis de sentimiento</p>
      </div>
      <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <p class="text-lat text-center">Análisis por tipo</p>
      </div>
    </div>

    <div class="row well">
      <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <div id="content">
          <canvas ref="chart"></canvas>
        </div>
      </div>
      <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <div id="content2">
          <canvas ref="chart2"></canvas>
        </div>
      </div>
    </div>
    <br /><br /><br />
    <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
      <p class="text-lat text-center">Análisis por dispositivo</p>
    </div>
    <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
      <p class="text-lat text-center">Análisis por tiempo</p>
    </div>
    <div class="row well">
      <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <div id="content3">
          <canvas ref="chart3"></canvas>
        </div>
      </div>
      <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <div id="content4">
          <canvas ref="chart4"></canvas>
        </div>
      </div>
    </div>
    <!-- <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
          <button class="btn btn-raised btn-primary" type="button" v-on:click.prevent="getexport()">
            <i class="fa fa-search"></i> Exportar
          </button>
        </div>
      </div>
    </div>-->
    <!-- <div class="row">
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
    </div>-->
  </div>
</template>
<script>
import swal from "sweetalert";
import VueCharts from "vue-chartjs";
import CommitChart from "./chart";
import JQuery from "jquery";
import Chart from "chart.js";
// import Raphael from "raphael/raphael";
// global.Raphael = Raphael;
import moment from "moment";
import "moment/locale/es";
//import { DonutChart, BarChart, LineChart, AreaChart } from "vue-morris";
//import XLSX from "xlsx";
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
  mounted() {},
  components: {
    CommitChart
  },

  data() {
    return {
      listaTweet: [],
      dataTweet: [],
      geocoder: "",
      palabra: "",
      kilometro: "",
      f_inicio: "",
      f_fin: "",
      great: "",
      good: "",
      neutral: "",
      bad: "",
      terrible: "",
      loading: false,
      donusData: [
        { label: "Red", value: 300 },
        { label: "Blue", value: 50 },
        { label: "yellow", value: 100 }
      ]
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
      let great = this.great;
      let good = this.good;
      let neutral = this.neutral;
      let bad = this.bad;
      let terrible = this.terrible;
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
              f_fin: f_fin,
              great: great,
              good: good,
              neutral: neutral,
              bad: bad,
              terrible: terrible
            }
          },
          config2
        )
        .then(response => {
          console.log(response);
          this.listaTweet = response.data;
          var dataTipo = [
            response.data.CountTwets,
            response.data.retweetsCount,
            response.data.repliesCount
          ];
          this.loading = false;
          var SourceObjectI = Object.keys(
            response.data.socurceMergeDispositive
          );
          var SourceObjectV = Object.values(
            response.data.socurceMergeDispositive
          );
          //TIME
          var timeObjectI = Object.keys(response.data.time);
          var timeObjectV = Object.values(response.data.time);
          // var itemsSource = response.data.socurceMergeDispositive.filter(
          //   (item, index, x) => console.log(item)
          // );
          /////////////////////
          var chart = this.$refs.chart;
          var chart2 = this.$refs.chart2;
          var chart3 = this.$refs.chart3;
          var chart4 = this.$refs.chart4;
          var ctx = chart.getContext("2d");
          var ctx2 = chart2.getContext("2d");
          var ctx3 = chart3.getContext("2d");
          var ctx4 = chart4.getContext("2d");
          var myChart = new Chart(ctx, {
            type: "bar",
            data: {
              labels: ["Muy bueno", "Bueno", "Neutro", "Malo", "Terrible"],
              datasets: [
                {
                  label: "Sentimiento",
                  data: response.data.sentimiento[0],
                  backgroundColor: [
                    "rgba(255, 99, 132, 0.2)",
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 206, 86, 0.2)",
                    "rgba(75, 192, 192, 0.2)",
                    "rgba(153, 102, 255, 0.2)"
                  ],
                  borderColor: [
                    "rgba(255,99,132,1)",
                    "rgba(54, 162, 235, 1)",
                    "rgba(255, 206, 86, 1)",
                    "rgba(75, 192, 192, 1)",
                    "rgba(153, 102, 255, 1)"
                  ],
                  borderWidth: 1
                }
              ],
              options: {
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        beginAtZero: true
                      }
                    }
                  ]
                }
              }
            }
          });

          var myChart2 = new Chart(ctx2, {
            type: "pie",
            data: {
              labels: ["Tweets", "Retweets", "Replies"],
              datasets: [
                {
                  label: "Tipo",
                  data: dataTipo,
                  backgroundColor: [
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 99, 132, 0.5)",
                    "rgba(153, 102, 255, 0.2)"
                  ],
                  borderColor: [
                    "rgba(255, 206, 86, 1)",
                    "rgba(75, 192, 192, 1)",
                    "rgba(153, 102, 255, 1)"
                  ],
                  borderWidth: 1
                }
              ],
              options: {
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        beginAtZero: true
                      }
                    }
                  ]
                }
              }
            }
          });

          var myChart3 = new Chart(ctx3, {
            type: "pie",
            data: {
              labels: SourceObjectI,
              datasets: [
                {
                  label: "Dispositivo",
                  data: SourceObjectV,
                  backgroundColor: [
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 99, 132, 0.5)",
                    "rgba(153, 102, 255, 0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(150,161,150,0.31)",
                    "rgba(93,161,72,0.53)",
                    "rgba(167,161,72,0.53)",
                    "rgba(59,187,188,0.53)",
                    "rgba(173,18,0,0.53)"
                  ],
                  borderColor: [
                    "rgba(255, 206, 86, 1)",
                    "rgba(75, 192, 192, 1)",
                    "rgba(153, 102, 255, 1)",
                    "rgba(167,161,72,0.53)",
                    "rgba(59,187,188,0.53)",
                    "rgba(255, 99, 132, 0.5)",
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(93,161,72,0.53)",
                    "rgba(157,118,113,0.2)",
                    "rgba(173,18,0,0.53)"
                  ],
                  borderWidth: 1
                }
              ],
              options: {
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        beginAtZero: true
                      }
                    }
                  ]
                }
              }
            }
          });

          var myChart4 = new Chart(ctx4, {
            type: "line",
            data: {
              labels: timeObjectI,
              datasets: [
                {
                  label: "Tiempo",
                  data: timeObjectV,
                  lineTension: 0,
                  backgroundColor: "transparent",
                  borderColor: "orange",
                  borderDash: [5, 5],
                  pointBorderColor: "orange",
                  pointBackgroundColor: "rgba(255,150,0,0.5)",
                  pointRadius: 5,
                  pointHoverRadius: 10,
                  pointHitRadius: 30,
                  pointBorderWidth: 2,
                  pointStyle: "rectRounded"
                }
              ]
            },
            options: {
              legend: {
                display: true,
                position: "top",
                labels: {
                  boxWidth: 80,
                  fontColor: "black"
                }
              }
            }
          });
        })
        .catch(error => {
          console.log(error);
        });
    }
    // getexport() {
    //   let geocoder = this.geocoder;
    //   let kilometro = this.kilometro;
    //   let palabra = this.palabra;
    //   let f_inicio = this.f_inicio;
    //   let f_fin = this.f_fin;
    //   this.loading = true;
    //   axios
    //     .get(
    //       "http://127.0.0.1:8000/search/getsocial",
    //       {
    //         params: {
    //           geocoder: geocoder,
    //           kilometro: kilometro,
    //           palabra: palabra,
    //           f_inicio: f_inicio,
    //           f_fin: f_fin
    //         }
    //       },
    //       config2
    //     )
    //     .then(response => {
    //       console.log(response);
    //       var data = [];
    //       // for (var element of response.data) {
    //       //   //console.log(element);
    //       //   var result = {};
    //       //   result["id"] = element.id_str;
    //       //   result["texto"] = element.full_text;
    //       //   result["NombreUsuario"] = element.user && element.user.name;
    //       //   result["Username"] = element.user && element.user.screen_name;
    //       //   result["Direccion"] = element.user && element.user.location;
    //       //   result["Descripcion"] = element.user && element.user.description;
    //       //   result["Imagen"] =
    //       //     element.user && element.user.profile_background_image_url_https;
    //       //   data.push(result);
    //       // }
    //       //console.log(data);
    //       this.loading = false;
    //       if (data.length > 0) {
    //         let excel = XLSX.utils.json_to_sheet(data);
    //         const workbook = XLSX.utils.book_new();
    //         const filename = "dev-tweets";
    //         XLSX.utils.book_append_sheet(workbook, excel, filename);
    //         XLSX.writeFile(workbook, `${filename}.xlsx`);
    //       }
    //     })
    //     .catch(error => {
    //       console.log(error);
    //     });
    // }
  }
};
</script>
<style scoped>
.text-lat {
  color: #15202a;
}

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
