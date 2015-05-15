$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $('#map-canvas').on('click', '.marker_link', function(e){
    e.preventDefault();

    var marker = e.target

    var request = $.ajax({
      method: 'GET',
      url: $(e.target).attr("href"),
    });

    request.done(function(response){
      var $response = $(response);
      $('#append').append(response);
      var $address = $('.address').text();
      $('input[name="location"]').val($address);
    });
  });

  $('#append').on('click', ':submit', function(e){
    console.log("You tried to create a new event")
    e.preventDefault();

    var form = $(this).parent().parent()
    var form_data = $(this).parent().serialize()
    var request = $.ajax({
      method: "POST",
      url: '/events',
      data: form_data,
      // dataType: 'json'
    });

    request.done(function(response){
      form.remove()
      // form.replaceWith(response)
      $('#append-2').append(response)
      console.log(response)
      debugger
    });
  });

});
