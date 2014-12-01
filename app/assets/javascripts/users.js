// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {

  $('#add-admin').on('click', function(){

    $('#admin-management').toggle();

  });

  $('#make-admin').on('click', function(){


    $('#admin-result').text('You have now created a new Admin')
    $.post('/makeAdmin?name=' + $('#post_user').val())

  });

});