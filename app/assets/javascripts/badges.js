 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {

  var i = 1;

  $('#left').on('click', function(){

    var images = ['/images/logo_black-01.png', '/images/padlock.png', '/images/logo_black-01.png', '/images/padlock.png', '/images/logo_black-01.png', '/images/padlock.png'];

    $('#reward_image').attr('src', images[i]);

    if(i<6) {
       return i++;
    }
    else {
       return i=0;
    }

  });

});