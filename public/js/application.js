$(document).ready(function() {
  
  $( "#take_a_poll_link" ).click(function( event ) {
    event.preventDefault();

    $.ajax({
      type: "get",
      url: "/polls/new",
      }).done(function( response ) {
        $( ".container" ).replaceWith( response )
    })
  })

  $( "#take_poll_form" ).submit(function( event ) {
    event.preventDefault();

    $.ajax({
      type: "post",
      url: "/surveys/:survey_id/polls",
      data: $("#take_poll_form").serialize()
      }).done(function( response ) {
        $( ".container" ).replaceWith( response )
    })
  })





});
