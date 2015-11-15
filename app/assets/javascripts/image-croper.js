var imageCroper;
imageCroper = function(width, height) {
  $('.click').on('click', function() {
    $('.the-new-image').Jcrop({
      aspectRatio: 1,
      maxSize: [ 350, 350 ],
      setSelect: [ 165, 337, 350, 350 ],
      addClass: 'jcrop-centered',
      boxHeight: 350
    });

  });
}

//$(document).ready(imageCroper);
//$(document).on('page:load', imageCroper);
