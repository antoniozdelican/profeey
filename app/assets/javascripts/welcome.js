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
  var checkboxAll = $('.the-checkbox-all');

  // checkbox for single person
  checkbox.on('click', function(e) {
    e.preventDefault();
    var checkboxContainer = $(this).closest('.the-checkbox-container');

    // uncheck
    if ($(this).hasClass('the-check-person')) {
      $(this).addClass('hidden');
      checkboxContainer.find('.the-uncheck-person').removeClass('hidden');
      checkboxContainer.find('.the-checkbox-real').prop('checked', false);
      // check if checkbox for all people is checked
      // if yes, uncheck it
      if ($('.the-checkbox-all-real').prop('checked')) {
        $('.the-check-all-people').addClass('hidden');
        $('.the-uncheck-all-people').removeClass('hidden');
        $('.the-checkbox-all-real').prop('checked', false);
      }
    } 
    // check
    else {
      $(this).addClass('hidden');
      checkboxContainer.find('.the-check-person').removeClass('hidden');
      checkboxContainer.find('.the-checkbox-real').prop('checked', true);    
      // check if all single checkboxes are checked
      // if yes, check checkbox for all people
      if ($('.the-checkbox-real:checked').length == $('.the-checkbox-real').length) {
        console.log('yes');
        $('.the-uncheck-all-people').addClass('hidden');
        $('.the-check-all-people').removeClass('hidden');
        $('.the-checkbox-all-real').prop('checked', true);
      }
    }
  });

  // checkbox for all people
  checkboxAll.on('click', function(e) {
    e.preventDefault();
    var checkboxContainer = $(this).closest('.the-checkbox-container');
    if ($(this).hasClass('the-check-all-people')) {
      $(this).addClass('hidden');
      checkboxContainer.find('.the-uncheck-all-people').removeClass('hidden');
      checkboxContainer.find('.the-checkbox-all-real').prop('checked', false);
      // uncheck all people
      $('.the-check-person').addClass('hidden');
      $('.the-uncheck-person').removeClass('hidden');
      $('.the-checkbox-real').prop('checked', false);
    } else {
      $(this).addClass('hidden');
      checkboxContainer.find('.the-check-all-people').removeClass('hidden');
      checkboxContainer.find('.the-checkbox-all-real').prop('checked', true);
      // check all people
      $('.the-uncheck-person').addClass('hidden');
      $('.the-check-person').removeClass('hidden');
      $('.the-checkbox-real').prop('checked', true);
    }
  });
}

$(document).ready(checker);
$(document).on('page:load', checker);
