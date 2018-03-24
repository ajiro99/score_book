// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
//= require Chart.min

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

  $("[id^='game_']").click(function(){
    $.get("http://" + location.host + "/score_books/" + $(this).attr("id").slice(5),
      function(data){ }
    );
    $('#game-modal').modal('open');
  });

  var countElm = $('.count'),
  countSpeed = 30;

  countElm.each(function(){
      var self = $(this),
      countMax = self.attr('data-num'),
      thisCount = self.text(),
      countTimer;

      function timer(){
          countTimer = setInterval(function(){
              var countNext = thisCount++;
              self.text(countNext);

              if(countNext == countMax){
                  clearInterval(countTimer);
              }
          },countSpeed);
      }
      timer();
  });
});