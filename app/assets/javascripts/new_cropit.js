// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var cropit2;

cropit2 = function() {

  $('.image-editor').cropit();


}

$(document).ready(cropit2);
$(document).on('page:load', cropit2);