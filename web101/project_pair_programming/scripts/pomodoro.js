var sessionTime = 25;
var breakTime = 5;
var currentRun = 0;
var timeRemaining = sessionTime

$(document).ready(function() {
  $("#sessionTime").text(sessionTime);
  $("#breakTime").text(breakTime);
  $("#currentRun").text("Current:" + " ");
  $("#timeRemaining").text(timeRemaining);

  $("button[name='session_up']").click(function() {
    sessionTime = sessionTime + 1;
      $("#sessionTime").text(sessionTime);
  });

  $("button[name='session_down']").click(function() {
    sessionTime = sessionTime - 1;
      $("#sessionTime").text(sessionTime);
  });


  $("button[name='play']").click(function() {
    var time = timeRemaining;
    countdown(time);
  });

  function countdown(time) {
    interval = setInterval(function() {
      time = time - 1;
      $("#timeRemaining").text(time);
    }, 1000 );
    if(time < 1) {
      
    }
  };




});
