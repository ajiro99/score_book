$(function() {
  $('.modal').modal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      inDuration: 300, // Transition in duration
      outDuration: 200, // Transition out duration
      startingTop: '4%', // Starting top style attribute
      endingTop: '10%' // Ending top style attribute
    }
  );

  $(document).on('click', "[id^='game_']", function (){
    $.get(location + "/score_books/" + $(this).attr("id").slice(5),
      function(data){ }
    );
    $('#game-modal').modal('open');
  });
});