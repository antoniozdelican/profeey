// Welcome flow JavaScript

// detects crop positions for Paperclip custom cropper processor
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

// mimics checkbox for custom checkboxes to select following people
var checker;
checker = function() {
  var checkbox = $('.the-checkbox');

  checkbox.on('click', function(e) {
    e.preventDefault();
    var checkboxContainer = $(this).closest('.the-checkbox-container');
    if ($(this).hasClass('the-check-person')) {
      $(this).addClass('hidden');
      checkboxContainer.find('.the-uncheck-person').removeClass('hidden');
      checkboxContainer.find('.the-checkbox-real').prop('checked', false);
    } else {
      $(this).addClass('hidden');
      checkboxContainer.find('.the-check-person').removeClass('hidden');
      checkboxContainer.find('.the-checkbox-real').prop('checked', true);
    }
  });
}

$(document).ready(checker);
$(document).on('page:load', checker);
