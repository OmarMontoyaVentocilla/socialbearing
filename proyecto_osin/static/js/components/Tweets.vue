<template>
    <div class="container">
    <div class="row">
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
             <div class="form-group" >  
                <label for="palabra" class="bmd-label-floating">Palabra:</label>
                <input type="text" class="form-control" name="palabra" id="palabra" v-model="palabra" autocomplete="off">
            </div>
             <div class="form-group" >  
                <label for="geocoder" class="bmd-label-floating">Latitud y longitud:</label>
                <input type="text" class="form-control" name="geocoder" id="geocoder" v-model="geocoder" autocomplete="off">
            </div>
             <div class="form-group" >  
                <label for="kilometro" class="bmd-label-floating">Km:</label>
                <input type="text" class="form-control" name="kilometro" id="kilometro" v-model="kilometro" autocomplete="off">
            </div>
            <div class="form-group">
                <button class="btn btn-raised btn-primary" type="button" v-on:click.prevent="getocial()"><i class="fa fa-search"></i> Buscar</button>
            </div> 
            <div class="form-group" v-show="loading">
              <i class="fa fa-spinner fa-spin" style="font-size:48px"></i> Cargando....
            </div> 
         </div>    
      </div>  
    </div>
</template>
<script>
import swal from 'sweetalert';
var tokent = document.querySelector('input[name="csrfmiddlewaretoken"]').value;
var config = {
     headers: {'X-CSRFToken': tokent}
};

var config2={
    headers: {
        'Access-Control-Allow-Origin': 'http://127.0.0.1:8000',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS',
        'Access-Control-Allow-Headers': '"Origin, X-Requested-With, Content-Type, Accept"',
        'Content-Type' : 'application/json',
        crossdomain: true
        }
};

export default{
       created(){
        // this.getocial();  
       },
       data(){
          return{
            listaTweet:[],
            geocoder:'',
            palabra:'',
            kilometro:'',
            loading:false
          }
       },
        methods:{
            mensaje(titulo,texto,icono){
             swal({
                 icon: icono,
                 title: titulo,
                 text: texto,
                 button: true,
                 timer: 1500
              })
           },
           getocial(){
                let geocoder=this.geocoder;
                let kilometro=this.kilometro;
                let palabra=this.palabra;
                this.loading = true;
               axios.get('http://127.0.0.1:8000/search/getsocial',{ 
                            params: { 
                                     geocoder: geocoder,
                                     kilometro:kilometro,
                                     palabra:palabra
                                    }
                        },config2)
               .then(response=>{
                   console.log(response);
                    this.loading = false;
               })
                .catch(error=>{
               console.log(error);
               }) 
           }
       }
}
</script>