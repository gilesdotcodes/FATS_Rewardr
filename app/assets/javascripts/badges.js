 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  var i = 0;
  var images = ['/images/angel.png', '/images/sales.png', '/images/customer.png', '/images/hardworker.png', '/images/team.png', '/images/leanonme.png'];
  var reward = ['Office Angel', 'Top Sales Person', 'Outstanding Customer Service', 'Grafter', 'Team Player', 'Lean On Me']

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