module Paperclip
  class Cropper < Thumbnail
    # def initialize(file, options = {}, attachment = nil)
    #   super
    #   @current_geometry.width  = target.crop_width
    #   @current_geometry.height = target.crop_height
    # end

    # def target
    #   @attachment.instance
    # end

    # def transformation_command
    #   crop_command = [
    #     "-crop",
    #     "#{target.crop_width}x" \
    #       "#{target.crop_height}+" \
    #       "#{target.crop_x}+" \
    #       "#{target.crop_y}",
    #     "+repage"
    #   ]
    #   Rails.logger.debug "yees"
    #   Rails.logger.debug target.crop_x
    #   Rails.logger.debug crop_command
    #   crop_command + super
    # end

    def transformation_command
      if crop_command
        crop_command + super.first.sub(/ -crop \S+/, '')
      else
        super
      end
    end
    
    def crop_command
      target = @attachment.instance
      crop_w = 300
      crop_h = 300
      crop_x = target.crop_x.to_i.abs
      crop_y = target.crop_y.to_i.abs
      
      # crop = " -crop #{crop_w}x#{crop_h}+#{target.crop_x}+#{target.crop_y} "
      # Rails.logger.debug @attachment
      # Rails.logger.debug @attachment.to_json
      # Rails.logger.debug target.to_json
      if target.cropping?
        Rails.logger.debug "antoniobla"
        #Rails.logger.debug target.profile_pic_geometry(:original).width
        # ratio = target.profile_pic_geometry(:original).width  / 300
        ratio = target.crop_ratio.to_f
        Rails.logger.debug "#{ratio}"
        crop = " -crop #{(crop_w/ratio).round}x#{(crop_h/ratio).round}+#{(crop_x/ratio).round}+#{(crop_y/ratio).round} "
        # " -crop '#{crop_w.to_i}x#{crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}'"
        # ["-crop", "#{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}"]
        "#{crop}"
      end
    end
  end
end