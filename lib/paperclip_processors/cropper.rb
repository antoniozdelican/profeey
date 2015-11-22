module Paperclip
  class Cropper < Thumbnail
    # overriding tranformation command from Paperclip and adding custom crop string for ImageMagick
    def transformation_command
      if crop_command
        crop_command + super.first.sub(/ -crop \S+/, '')
      else
        super
      end
    end
    
    def crop_command
      target = @attachment.instance
      if target.cropping?
        # crop dimensions for profile_pic are 300x300px
        crop_w = 300
        crop_h = 300

        # crop offsets from js
        crop_x = target.crop_x.to_i.abs
        crop_y = target.crop_y.to_i.abs

        # crop ratio from js
        ratio = target.crop_ratio.to_f
        
        # crop string for ImageMagick
        # notice the space at the end of the string!!
        crop = " -crop #{(crop_w/ratio).round}x#{(crop_h/ratio).round}+#{(crop_x/ratio).round}+#{(crop_y/ratio).round} "
        "#{crop}"
      end
    end
  end
end