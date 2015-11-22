// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var cropit2;

cropit2 = function() {

  $('.image-editor').cropit({
    onOffsetChange: function() {
      var obj = $('.image-editor').cropit('offset');
      var x1 = obj['x'];
      var y1 = obj['y'];
      var x2 = x1 + 300;
      var y2 = y1 + 300;
      //console.log($('.image-editor').cropit('offset')['y']);
      console.log(x1 + ', ' + x2);
      console.log(y1 + ', ' + y2);
      $('#cropX').val(x1);
      $('#cropY').val(y1);

      var obj2 = $('.image-editor').cropit('zoom');
      console.log(obj2.toFixed(2));

      $('#cropRatio').val(obj2.toFixed(2));
      //var obj3 = $('.image-editor').cropit('imageSize');
      //console.log(obj3['width']*obj2)

    }
  });

  // $('.cropit2-form').submit(function() {
  //   // Move cropped image data to hidden input
  //   var imageData = $('.image-editor').cropit('export');
  //   $('.hidden-image-data').val(imageData);

  //   // Print HTTP request params
  //   //var formValue = $(this).serialize();
  //   //$('#result-data').text(formValue);

  //   // Prevent the form from actually submitting
  //   return false;
  // });


}

$(document).ready(cropit2);
$(document).on('page:load', cropit2);