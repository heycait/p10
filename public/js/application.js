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
      method: 'POST',
      url: '/events',
      data: form_data,
    });

    request.done(function(response){
      form.remove()
      $('#append-2').append(response)
    });
  });

  $('#append-2').on('click', ':submit', function(e){
    console.log("You invited some peeps, homies, and honies")
    e.preventDefault();

    var attendee_data = $(this).parent().serialize()
    var $form_field = $(this).siblings('textarea')

    var request = $.ajax({
      method: 'POST',
      url: '/attendees',
      data: attendee_data,
      dataType: 'json',
    });

    $form_field.val('')

    request.done(function(response){
      // console.log(response)
      // var new_li = '<li><li>'.text('<a href="/events/<%= response.id %>"><%= response.title %></a>')
      // $('.add_event').append(new_li)
      // debugger
    });
  });
});

// <li><a href="/events/<%= event.id %>"><%= event.title %></a></li>
