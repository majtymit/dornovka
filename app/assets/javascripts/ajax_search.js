$(document).on('ready page:load', function() {
  $( "#search-form" ).submit(function( event ) {
    $.ajax({
      method: "GET",
      url: "/ajax",
      data: { query: $('#search-keyword').val() }
    })
    .done(function( msg ) {
      //alert( "Data Saved: " + msg );
      $("#isotope-content").html(msg);
      sfApp.reloadIsotope();
    });
    event.preventDefault();
  });
});
