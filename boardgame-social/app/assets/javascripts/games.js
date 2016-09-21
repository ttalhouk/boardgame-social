// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
  $(".game-panel-heading").on('click', function(e){
    console.log("clicked" + $(this));
    $(this).find("span").toggle();
    $(this).next().toggle(250);
  });
});
