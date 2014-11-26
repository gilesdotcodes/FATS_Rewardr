 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {

  var i = 0;
  var images = ['/images/logo_black-01.png', '/images/padlock.png', '/images/logo_black-01.png', '/images/padlock.png', '/images/logo_black-01.png', '/images/padlock.png'];
  var reward = ['Award 1', 'Award 2', 'Award 3', 'Award 4', 'Award 5', 'Award 6']

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

  $('#right').on('click', function(){

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