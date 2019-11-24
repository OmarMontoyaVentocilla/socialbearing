<template>
    <div class="container">
    <div class="row">
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            trtrt
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
         this.getocial();  
       },
       data(){
          return{
            listaTweet:[]
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
               axios.get('http://127.0.0.1:8000/search/getsocial',config2)
               .then(response=>{
                   console.log(response);
               })
                .catch(error=>{
               console.log(error);
               }) 
           }
       }
}
</script>