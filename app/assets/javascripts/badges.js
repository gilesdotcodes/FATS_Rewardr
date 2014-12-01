 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  var i = 0;
  var images = ['/images/Angel.gif', '/images/sales.jpeg', '/images/service.png', '/images/Star.png', '/images/Positive.png', '/images/lean.png', '/images/team.png'];
  var reward = ['Angel', 'Sales', 'Service', 'Star', 'Positive', 'Lean', 'Team']

  $('.button').on('click', function(){

    $('#reward_image').attr('src', images[i]);

    $('#badge_name').val(reward[i])

    if(i<6) {
       return i++;
    }
    else {
       return i=0;
    }

  });

});