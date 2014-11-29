 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {

  var i = 0;
  var images = ['/images/angel.gif', '/images/sales.jpeg', '/images/service.png', '/images/star.png', '/images/positive.png', '/images/lean.png'];
  var reward = ['Angel', 'Sales', 'Service', 'Star', 'Positive', 'Lean']

  // $('#left').on('click', function(){

  //   $('#reward_image').attr('src', images[i]);

  //   $('#badge_name').val(reward[i])

  //   if(i>0) {
  //      return i--;
  //   }
  //   else {
  //      return i=5;
  //   }

  // });

  $('.button').on('click', function(){

    $('#reward_image').attr('src', images[i]);

    $('#badge_name').val(reward[i])

    if(i<5) {
       return i++;
    }
    else {
       return i=0;
    }

  });

});