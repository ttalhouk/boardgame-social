// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
  $("body").on('click',".user-panel-heading", function(e){
    console.log("clicked" + $(this));
    $(this).find("span").toggle();
    $(this).next().toggle(250);
  });
  $(document).ajaxStart(function(e){
    $('#results-list').html("")
    $('.loading').show();
  });
  $(document).ajaxComplete(function(e){
    $('.loading').hide();
  })

});
