$(document).ready(function() {

  $( "#take_a_poll_link" ).click(function( event ) {
    event.preventDefault();

    $.ajax({
      type: "get",
      url: "/polls/new",
      }).done(function( response ) {
        $( ".container" ).replaceWith( response )
    });
  });

  $( "#take_poll_form" ).submit(function( event ) {
    event.preventDefault();

    $.ajax({
      type: "post",
      url: "/surveys/:survey_id/polls",
      data: $("#take_poll_form").serialize()
      }).done(function( response ) {
        $( ".container" ).replaceWith( response )
    });
  });

  $('#add-question').on('click', function( event ) {
    $('#question-group').append(addQuestion);
  });

  $('#question-group').on('click', '.add-choice', function( event ) {
    var questionId = parseInt($(this).parent().attr('id')
                     .replace('question_', ''), 10);
    $(this).prev().append(addChoice(questionId));
  });


});

function addQuestion() {
  var newQuestionId = $('#question-group .question').length;
  var html = "<hr><div class='question' id='question_" + newQuestionId + "'>" +
             "<div class='form-group'>" +
             "<label class='form-label col-lg-1' for='question-text'>Question:</label>" +
             "<textarea class='col-lg-8' id='question-text' type='text' name='survey[" + newQuestionId + "][0]'></textarea>" +
             "</div>" +
             "<div class='choice-group'>" +
             addChoice( newQuestionId ) +
             "</div>" +
             "<div class='add-choice btn btn-xs btn-default'>Add Choice</div>" +
             "</div>";
  return html;
}

function addChoice(questionId) {
  var choiceId = $('#question_' + questionId + ' .choice').length + 1;
  var html = "<div class='form-group choice'>" +
             "<label class='form-label col-lg-1' for='choice_" + questionId + "_" + choiceId + "'>Choice:</label>" +
             "<input class='col-lg-8' id='choice_" + questionId + "_" + choiceId + "' type='text' name='survey[" + questionId + "][" + choiceId + "]'/>" +
             "</div>";
  return html;
}
