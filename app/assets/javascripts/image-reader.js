// Image reader with FileReader
// not sure if compatible with all browsers!!

var imageReader;
imageReader = function() {
  var imageInput = $('#imageInput');
  var imageArea = $('#imageArea');

  imageInput.on('change', function(e) {
    var file = imageInput[0].files[0];
    var imageType = /image.*/;

    if (file) {
      if (file.type.match(imageType)) {
        var reader = new FileReader();

        reader.onload = function(e) {
          // clean previous images
          imageArea.html('');  
          // create new image
          var img = $('<img />'); //Equivalent: $(document.createElement('img'))
          img.attr('src', reader.result);
          imageArea.append(img);
        }
        // read content of the file
        reader.readAsDataURL(file); 
      } else {
        imageArea.html('File not supported!');
      }
    } else {
      imageArea.html('');
    }  
  });
}

$(document).ready(imageReader);
$(document).on('page:load', imageReader);
