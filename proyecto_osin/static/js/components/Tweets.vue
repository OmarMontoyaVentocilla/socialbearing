<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat">
          Para buscar latitud y longitud ir a cualquiera de los siguientes
          enlaces:
        </p>

        <p class="text-lat">
          <a href="https://www.latlong.net/" target="_blank">Latitud y longitud</a>
        </p>
        <p class="text-lat">
          <a href="https://www.google.com.pe/maps/" target="_blank">Google Maps</a>
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
        <p class="text-lat">Ingrese los datos para la gráfica de análisis de sentimiento</p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="great" class="bmd-label-floating">Positivo:</label>
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
          <label for="bad" class="bmd-label-floating">Negativo:</label>
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
          <label for="f_inicio" class="bmd-label-floating">Fecha Inicio:</label>
          <input type="date" class="form-control" name="f_inicio" id="f_inicio" v-model="f_inicio" />
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
        <div class="form-group">
          <label for="f_inicio" class="bmd-label-floating">Fecha Fin:</label>
          <input type="date" class="form-control" name="f_fin" id="f_fin" v-model="f_fin" />
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        <div class="form-group">
          <button class="btn btn-raised btn-primary" type="button" v-on:click.prevent="getocial()">
            <i class="fa fa-search"></i> Buscar
          </button>
        </div>
        <div class="form-group" v-show="loading">
          <i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
          Cargando....
        </div>
      </div>
    </div>
    <br />
    <br />
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
    </div>-->

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
    <br />
    <br />
    <br />
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat text-center">Análisis de sentimiento</p>
        <center>
          <a
            class="btn btn-primary"
            href="#open-modal"
            data-toggle="modal"
            data-target="#open-modal"
          >Ver detalle</a>
        </center>
      </div>
    </div>

    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div id="content">
          <canvas id="chart"></canvas>
        </div>
      </div>
    </div>

    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat text-center">Análisis por tipo</p>
      </div>
    </div>

    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div id="content2">
          <canvas id="chart2"></canvas>
        </div>
      </div>
    </div>
    <br />
    <br />
    <br />
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat text-center">Análisis por dispositivo</p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div id="content3">
          <canvas id="chart3"></canvas>
        </div>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat text-center">Análisis por tiempo</p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div id="content4">
          <canvas id="chart4"></canvas>
        </div>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat text-center">HASHTAG CLOUD</p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
        <div id="content5">
          <canvas id="chart5"></canvas>
        </div>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <p class="text-lat text-center">Top Palabra Cloud</p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
        <div id="content6">
          <canvas id="chart6"></canvas>
        </div>
      </div>
    </div>

    <div id="open-modal" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Detalle de sentimiento:</h4>
          </div>
          <div class="modal-body">
            <h4 class="modal-title text-center">Positivo:</h4>
            <br />
            <div class="panel panel-success panel_estilo">
              <div class="panel-body div1 table-responsive">
                <table
                  class="table table-bordered table-hover table-fixed table-striped"
                  style="background:white;"
                >
                  <thead>
                    <tr>
                      <th>Palabra</th>
                      <th>Cantidad</th>
                    </tr>
                  </thead>
                  <tbody>
                    <template v-if="valorGeneral!= ''">
                      <tr v-for="(list, index) in valorGeneral">
                        <td class="nombre_info">{{ list.nombre }}</td>
                        <td class="nombre_info">{{ list.valor}}</td>
                      </tr>
                    </template>
                    <template v-else>
                      <td colspan="2" class="nombre_info text-center">No hay resultados</td>
                    </template>
                  </tbody>
                </table>
              </div>
            </div>
            <br />
            <br />
            <h4 class="modal-title text-center">Neutro:</h4>
            <br />
            <div class="panel panel-success panel_estilo">
              <div class="panel-body div1 table-responsive">
                <table
                  class="table table-bordered table-hover table-fixed table-striped"
                  style="background:white;"
                >
                  <thead>
                    <tr>
                      <th>Palabra</th>
                      <th>Cantidad</th>
                    </tr>
                  </thead>
                  <tbody>
                    <template v-if="valorGeneralN!= ''">
                      <tr v-for="(list, index) in valorGeneralN">
                        <td class="nombre_info">{{ list.nombre }}</td>
                        <td class="nombre_info">{{ list.valor}}</td>
                      </tr>
                    </template>
                    <template v-else>
                      <td colspan="2" class="nombre_info text-center">No hay resultados</td>
                    </template>
                  </tbody>
                </table>
              </div>
            </div>
            <br />
            <br />
            <h4 class="modal-title text-center">Negativo:</h4>
            <br />
            <div class="panel panel-success panel_estilo">
              <div class="panel-body div1 table-responsive">
                <table
                  class="table table-bordered table-hover table-fixed table-striped"
                  style="background:white;"
                >
                  <thead>
                    <tr>
                      <th>Palabra</th>
                      <th>Cantidad</th>
                    </tr>
                  </thead>
                  <tbody>
                    <template v-if="valorGeneralB!= ''">
                      <tr v-for="(list, index) in valorGeneralB">
                        <td class="nombre_info">{{ list.nombre }}</td>
                        <td class="nombre_info">{{ list.valor}}</td>
                      </tr>
                    </template>
                    <template v-else>
                      <td colspan="2" class="nombre_info text-center">No hay resultados</td>
                    </template>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        <p class="text-lat">Ingrese los palabra a buscar:</p>
      </div>
    </div>
    <div class="row well">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="great" class="bmd-label-floating">Texto:</label>
          <input
            type="text"
            class="form-control"
            name="wordcloud"
            id="wordcloud"
            v-model="wordcloud"
            autocomplete="off"
          />
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
        <div class="form-group">
          <label for="great" class="bmd-label-floating">Usuario:</label>
          <input
            type="text"
            class="form-control"
            name="user"
            id="user"
            v-model="user"
            autocomplete="off"
          />
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
                  <!-- <th>#</th> -->
                  <th>Datos</th>
                </tr>
              </thead>
              <tbody>
                <template v-if="filteredList != ''">
                  <tr v-for="(list, index) in filteredList">
                    <!-- <td>{{ list.id_str }}</td> -->
                    <td>
                      <table class="table table-bordered">
                        <tr>
                          <td rowspan="6" class="estilo_wi_rows text-center">
                            <img :src="list.user && list.user.profile_image_url" />
                          </td>
                          <td class="nombre_info">{{ list.user && list.user.name }}</td>
                        </tr>
                        <tr>
                          <td
                            class="textResponse"
                            id="textResponse"
                          >{{ replaceURLWithHTMLLinks(list.full_text)}}</td>
                        </tr>
                        <tr>
                          <td class="nombre_link">
                            <a
                              :href="list.user && 'https://twitter.com/'+ list.user.screen_name"
                              target="_blank"
                            >
                              Usuario:
                              https://twitter.com/{{
                              list.user &&
                              list.user.screen_name
                              }}
                            </a>
                          </td>
                        </tr>
                        <tr>
                          <td class="nombre_info">Dirección: {{ list.user && list.user.location }}</td>
                        </tr>
                        <tr>
                          <td class="nombre_info">
                            Descripción:
                            {{ list.user && list.user.description }}
                          </td>
                        </tr>
                        <tr>
                          <td class="nombre_info">
                            Fecha de creación:
                            {{ format_date(list.created_at) }}
                          </td>
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
import VueCharts from "vue-chartjs";
import CommitChart from "./chart";
import JQuery from "jquery";
import Chart from "chart.js";
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
    this.getPositivo();
    this.getNeutro();
    this.getNegativo();

    //var elm=document.getElementById("text2url");elm.innerHTML=replaceURLWithHTMLLinks(elm.innerHTML);});
  },
  mounted() {},
  components: {
    CommitChart
  },

  data() {
    return {
      listaTweet: [],
      positivo: [],
      valorGeneral: [],
      valorGeneralN: [],
      valorGeneralB: [],
      neutro: [],
      names: ["Positivo", "Neutro", "Negativo"],
      values: [],
      negativo: [],
      dataTweet: [],
      user: "",
      listaItemCloud: [],
      listaValueCloud: [],
      geocoder: "",
      palabra: "",
      kilometro: "",
      f_inicio: "",
      f_fin: "",
      great: "",
      good: "",
      neutral: "",
      bad: "",
      wordcloud: "",
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

    getPositivo() {
      axios
        .get("http://127.0.0.1:8000/api/positivo/")
        .then(response => {
          this.positivo = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
    getNeutro() {
      axios
        .get("http://127.0.0.1:8000/api/neutro/")
        .then(response => {
          this.neutro = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },

    replaceURLWithHTMLLinks(e) {
      return e.replace(
        /(\(.*?)?\b((?:https?|ftp|file):\/\/[-a-z0-9+&@#\/%?=~_()|!:,.;]*[-a-z0-9+&@#\/%=~_()|])/gi,
        function(e, r, n) {
          var t = "";
          r = r || "";
          for (var a = /\(/g; a.exec(r); ) {
            var l;
            (l = /(.*)(\.\).*)/.exec(n) || /(.*)(\).*)/.exec(n)) &&
              ((n = l[1]), (t = l[2] + t));
          }
          return "";
        }
      );
    },

    getNegativo() {
      axios
        .get("http://127.0.0.1:8000/api/negativo/")
        .then(response => {
          this.negativo = response.data;
        })
        .catch(error => {
          console.log(error);
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
      let neutral = this.neutral;
      let bad = this.bad;
      let wordcloud = this.wordcloud;
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
              neutral: neutral,
              bad: bad,
              wordcloud: wordcloud
            }
          },
          config2
        )
        .then(response => {
          console.log(response);
          this.listaTweet = response.data;
          this.valorGeneral = response.data.valorGeneral;
          this.valorGeneralN = response.data.valorGeneralN;
          this.valorGeneralB = response.data.valorGeneralB;
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

          var HastagObjectI = Object.keys(response.data.hastagMasRepetidos);
          var HastagObjectV = Object.values(response.data.hastagMasRepetidos);

          //TIME
          var tiempo = [];
          for (let i of response.data.data) {
            tiempo.push(moment(i.created_at).format("hh:mm A"));
          }
          var repetidos = {};
          tiempo.forEach(function(numero) {
            repetidos[numero] = (repetidos[numero] || 0) + 1;
          });
          console.log(repetidos);

          var timeObjectI = Object.keys(repetidos);
          var timeObjectV = Object.values(repetidos);
          // var itemsSource = response.data.socurceMergeDispositive.filter(
          //   (item, index, x) => console.log(item)
          // );
          /////////////////////
          //PALABRAS CLOUD
          var wordObjectI = Object.keys(response.data.palabraListMasRepetidos);
          var wordObjectV = Object.values(
            response.data.palabraListMasRepetidos
          );
          //this.replaceURLWithHTMLLinks($("#textResponse").html());
          var chart = document.getElementById("content");
          chart.innerHTML = "&nbsp;";
          $("#content").append('<canvas id="chart"><canvas>');
          var ctx = $("#chart")
            .get(0)
            .getContext("2d");

          var chart2 = document.getElementById("content2");
          chart2.innerHTML = "&nbsp;";
          $("#content2").append('<canvas id="chart2"><canvas>');
          var ctx2 = $("#chart2")
            .get(0)
            .getContext("2d");

          var chart3 = document.getElementById("content3");
          chart3.innerHTML = "&nbsp;";
          $("#content3").append('<canvas id="chart3"><canvas>');
          var ctx3 = $("#chart3")
            .get(0)
            .getContext("2d");

          var chart4 = document.getElementById("content4");
          chart4.innerHTML = "&nbsp;";
          $("#content4").append('<canvas id="chart4"><canvas>');
          var ctx4 = $("#chart4")
            .get(0)
            .getContext("2d");

          var chart5 = document.getElementById("content5");
          chart5.innerHTML = "&nbsp;";
          $("#content5").append('<canvas id="chart5"><canvas>');
          var ctx5 = $("#chart5")
            .get(0)
            .getContext("2d");

          var chart6 = document.getElementById("content6");
          chart6.innerHTML = "&nbsp;";
          $("#content6").append('<canvas id="chart6"><canvas>');
          var ctx6 = $("#chart6")
            .get(0)
            .getContext("2d");

          //sentimiento nuevo

          var myChart = new Chart(ctx, {
            type: "horizontalBar",
            data: {
              labels: ["Positivo", "Neutro", "Negativo"],
              datasets: [
                {
                  label: "Sentimiento",
                  data: response.data.sentimiento[0],
                  backgroundColor: [
                    "rgba(90, 190, 120, 1)",
                    "rgba(214, 181, 52, 1)",
                    "rgba(184, 59, 69, 1)"
                  ],
                  borderColor: [
                    "rgba(90, 190, 120, 1)",
                    "rgba(214, 181, 52, 1)",
                    "rgba(184, 59, 69, 1)"
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
                    "rgba(93,161,72,0.53)",
                    "rgba(173,18,0,0.53)"
                  ],
                  borderColor: [
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(93,161,72,0.53)",
                    "rgba(173,18,0,0.53)"
                  ],
                  borderWidth: 1
                }
              ]
            },
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
          });
          //andy pull origin master
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
                  label: "LÍNEA DE TIEMPO",
                  data: timeObjectV,
                  lineTension: 0,
                  backgroundColor: "transparent",
                  pointColor: "rgba(14, 0, 21, 1)",
                  borderColor: "rgba(14, 0, 21, 1)", //borderDash: [5, 5],
                  pointBorderColor: "rgba(14, 0, 21, 1)",
                  pointBackgroundColor: "rgba(14, 0, 21, 1)",
                  pointHoverBackgroundColor: "rgba(14, 0, 21, 1)",
                  pointRadius: 5,
                  pointBorderWidth: 10,
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
                  fontColor: "rgba(14, 0, 21, 1)"
                }
              }
            }
          });

          var myChart5 = new Chart(ctx5, {
            type: "horizontalBar",
            data: {
              labels: HastagObjectI.slice(0, 10),
              datasets: [
                {
                  label: "HASHTAG",
                  data: HastagObjectV.slice(0, 10),
                  backgroundColor: [
                    "rgba(157,118,113,0.2)",
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 206, 86, 0.2)",
                    "rgba(255, 206, 86, 1)",
                    "rgba(75, 192, 192, 1)",
                    "rgba(153, 102, 255, 1)",
                    "rgba(167,161,72,0.53)",
                    "rgba(59,187,188,0.53)",
                    "rgba(255, 99, 132, 0.5)",
                    "rgba(54, 162, 235, 0.2)"
                  ],
                  borderColor: [
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)",
                    "rgba(157,118,113,0.2)"
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

          var myChart6 = new Chart(ctx6, {
            type: "line",
            data: {
              labels: wordObjectI.slice(0, 10),
              datasets: [
                {
                  label: "Cantidad",
                  data: wordObjectV.slice(0, 10),
                  lineTension: 0,
                  backgroundColor: "transparent",
                  pointColor: "rgba(14, 0, 21, 1)",
                  borderColor: "rgba(14, 0, 21, 1)", //borderDash: [5, 5],
                  pointBorderColor: "rgba(14, 0, 21, 1)",
                  pointBackgroundColor: "rgba(14, 0, 21, 1)",
                  pointHoverBackgroundColor: "rgba(14, 0, 21, 1)",
                  pointRadius: 5,
                  pointBorderWidth: 10,
                  pointHoverRadius: 10,
                  pointHoverRadius: 10,
                  fill: false,
                  pointHitRadius: 30,
                  pointBorderWidth: 2,
                  pointStyle: "rectRounded"
                }
              ]
            },
            options: {
              legend: {
                display: false,
                position: "top",
                labels: {
                  boxWidth: 80,
                  fontColor: "rgba(14, 0, 21, 1)"
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
  },
  computed: {
    filteredList() {
      if (this.listaTweet.data) {
        return this.listaTweet.data
          .filter(res => {
            return res.full_text
              .toLowerCase()
              .includes(this.wordcloud.toLowerCase());
          })
          .filter(res => {
            return res.user.name
              .toLowerCase()
              .includes(this.user.toLowerCase());
          });
      }
    }
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

.modal-window {
  position: fixed;
  background-color: hsla(0, 0%, 0%, 0.53);
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 999;
  visibility: hidden;
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s;
}
.modal-window:target {
  visibility: visible;
  opacity: 1;
  pointer-events: auto;
}
.modal-window > div {
  width: 400px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  padding: 2em;
  background: #ffffff;
}
.modal-window header {
  font-weight: bold;
}
.modal-window h1 {
  font-size: 150%;
  margin: 0 0 15px;
}

.modal-close {
  color: #aaa;
  line-height: 50px;
  font-size: 80%;
  position: absolute;
  right: 0;
  text-align: center;
  top: 0;
  width: 70px;
  text-decoration: none;
}
.modal-close:hover {
  color: black;
}
.modal-window div:not(:last-of-type) {
  margin-bottom: 15px;
}
</style>
