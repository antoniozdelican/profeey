var imageCroper;
imageCroper = function() {
  $('#target').Jcrop({
    setSelect: [ 0, 0, 200, 200 ] 
  });
}

$(document).ready(imageCroper);
$(document).on('page:load', imageCroper);