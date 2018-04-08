$(function() {
  var countElm = $('.count'),
  countSpeed = 35;

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