$(document).ready(function(){

  $('select').material_select(function (){
    var potato = $(".select-dropdown");
    console.log(potato);
  });

  $(".button-collapse").sideNav();
  console.log("set up materialize")
});
