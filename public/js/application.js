$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $('#map-canvas').on('click', '.marker_link', function(e){
    e.preventDefault();

    var request = $.ajax({
      method: 'GET',
      url: $(e.target).attr("href"),
    });

    request.done(function(response){
      debugger
    });
  });

});
