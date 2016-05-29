$(document).on('ready page:load', function() {
  var previousQuery;

  $('#search-keyword').keyup(function( event ) {
    var element = $(this);
    var value = element.val();

    if (value && value.length < 3 && value !== previousQuery) return;

    previousQuery = value;

    $.ajax({
      method: 'GET',
      url: '/blog/ajax',
      data: { query: value }
    })
    .done(function(postsHtml) {
      var isotopeContent = $('#isotope-content');

      isotopeContent.html(postsHtml).isotope('reloadItems').isotope();
      sfApp.reloadIsotope();

      isotopeContent.imagesLoaded(function() {
        sfApp.reloadIsotope();
      })
    });
  });
});
