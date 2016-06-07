$(document).on('ready page:load', function() {
  var previousQuery;

  $('#search-keyword').on('keyup', _.debounce(function( event ) {
    var element = $(this);
    var value = element.val();

    if (previousQuery == value)
      return;

    previousQuery = value;

    $.ajax({
      method: 'GET',
      url: '/blog/ajax',
      data: { query: value }
    })
    .done(function(postsHtml) {
      var isotopeContent = $('#isotope-content');

      isotopeContent.html(postsHtml).isotope('reloadItems').isotope();
      setTimeout(sfApp.reloadIsotope, 1500);

      isotopeContent.imagesLoaded(function() {
        sfApp.reloadIsotope();
      })
    });
  }, 300));
});
