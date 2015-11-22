// Welcome flow JavaScript

var cropit;

cropit = function() {
  var profilePicUpload = $('.the-profile-pic-upload');
  
  profilePicUpload.cropit({
    imageBackground: true,
    imageBackgroundBorderWidth: 20,
    onOffsetChange: function() {
      // setting the x and y offsets
      var offset = profilePicUpload.cropit('offset');
      var x = offset['x'];
      var y = offset['y'];
      $('#cropX').val(x);
      $('#cropY').val(y);

      // setting the ratio
      var ratio = profilePicUpload.cropit('zoom');
      $('#cropRatio').val(ratio.toFixed(2));
    }
  });
}

$(document).ready(cropit);
$(document).on('page:load', cropit);