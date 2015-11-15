// Image reader with FileReader
// not sure if compatible with all browsers!!

var imageReader;
imageReader = function() {
  var imageUpload = $('.the-image-upload');
  var imageInput = $('#imageInput');
  var newImageContainer = $('.the-new-image-container');
  var imageArea = $('.the-new-image-area');

  var removeNewImageButton = $('.btn-remove-new-image');

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
          var img = $('<img class="img-responsive the-new-image"/>'); //Equivalent: $(document.createElement('img'))
          //var img = new Image();         

          // put data into image
          img.attr('src', reader.result);
          //img.src = reader.result;
          //img.className = 'img-responsive the-new-image';

          //console.log(img.width);

          //img.onload = function(e) {
          //  img.height = '350';

            //imageCroper();

          //};

          // var imageWidth = img.width;
          // var imageHeight = img.height;
          // if (imageWidth >= imageHeight) {
          //   // scale bigger width to 350
          //   console.log('Width:');
          //   //console.log(imageWidth);
          //   img.width = '350';
          //   //imageCroper(imageWidth, 350)
          // } else {
          //   // scale bigger height to 350
          //   console.log('Height:');
          //   //console.log(imageHeight);
          //   img.height = '350';
          //   //imageCroper(350, imageHeight);
          // }
          imageUpload.addClass('hidden');
          newImageContainer.removeClass('hidden');
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
  
  removeNewImageButton.on('click', function() {
    imageArea.html('');
    newImageContainer.addClass('hidden');
    imageUpload.removeClass('hidden');
  });
}

$(document).ready(imageReader);
$(document).on('page:load', imageReader);
