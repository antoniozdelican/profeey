class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true 
  has_and_belongs_to_many :professions
  #accepts_nested_attributes_for :professions, reject_if: :check_profession
  accepts_nested_attributes_for :professions

  has_attached_file :profile_pic, styles: { original: { :processors => [:cropper] }, large: '300x300#' }, default_url: ":style/default.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :crop_ratio
  after_update :reprocess_profile_pic, :if => :cropping?

  def professions_attributes=(hash)
    hash.each do |sequence, profession_values|
      if !professions.where(name: profession_values[:name]).any?
        # hack redo this later!!!
        professions.destroy_all
        professions << Profession.find_or_create_by(name: profession_values[:name])
      end
    end
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank? && !crop_ratio.blank?
  end

  def profile_pic_geometry(style = :original)
    logger.debug style
    logger.debug profile_pic.path(style)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(profile_pic.path(style))
  end

  private

  def reprocess_profile_pic
    logger.debug 'reprocesss'
    profile_pic.assign(profile_pic)
    profile_pic.save
    #profile_pic.reprocess!
  end


    # checks if profession in nested attributes already exists
    # def check_profession(profession)
    #   if existing_profession = Profession.find_by(name: profession['name'])
    #     self.professions << existing_profession
    #     true
    #   else
    #     false
    #   end
    # end
end
