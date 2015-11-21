// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var cropit;

cropit = function() {

  var profilePicUpload = $('.the-profile-pic-upload');
  var profilePicInputContainer = $('.the-profile-pic-input-container');

  var profilePicInput = $('#profilePicInput');

  var profilePicPreviewContainer = $('.the-profile-pic-preview-container');

  var removeProfilePicButton = $('.btn-remove-profile-pic');

  profilePicUpload.cropit({
    exportZoom: 1.25,
    imageBackground: true,
    imageBackgroundBorderWidth: 20
  });

  profilePicInput.on('change', function() {
    var file = profilePicInput[0].files[0];
    if (file) {
      profilePicPreviewContainer.removeClass('hidden');
      profilePicInputContainer.addClass('hidden');
    }
  });

  removeProfilePicButton.on('click', function() {
    profilePicPreviewContainer.addClass('hidden');
    
    // removing old image
    profilePicInput.val('');
    $('.cropit-image-background').attr('src', '');
    $('.cropit-image-preview').css('background-image', 'none');
    
    profilePicInputContainer.removeClass('hidden');
  });

}

$(document).ready(cropit);
$(document).on('page:load', cropit);