class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :full_name, presence: true

  # Paperclip with custom processor cropper for original profile_pic
  has_attached_file :profile_pic, 
    styles: { 
      original: { :processors => [:cropper] }, large: '300x300#', medium: '200x200#', small: '40x40#'
    }, 
    default_url: ":style/default.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  # Professions
  has_and_belongs_to_many :professions
  accepts_nested_attributes_for :professions

  # FollowRelationships
  has_many :active_follow_relationships, class_name: 'FollowRelationship', 
                                  foreign_key: 'follower_id', 
                                  dependent: :destroy
  has_many :passive_follow_relationships, class_name: 'FollowRelationship', 
                                  foreign_key: 'followed_id', 
                                  dependent: :destroy
  has_many :following, through: :active_follow_relationships, source: :followed
  has_many :followers, through: :passive_follow_relationships, source: :follower

  # Tweak and attributes for custom processor cropper
  attr_accessor :crop_x, :crop_y, :crop_ratio
  after_update :reprocess_profile_pic, if: :cropping?

  # Adjusting professions_attributes
  def professions_attributes=(hash)
    hash.each do |sequence, profession_values|
      if !professions.where(name: profession_values[:name]).any?
        # hack redo this later!!!
        professions.destroy_all
        professions << Profession.find_or_create_by(name: profession_values[:name])
      end
    end
  end

  # Confirm it's cropping for Paperclip
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_ratio.blank?
  end

  # Follows a user
  def follow(other_user)
    active_follow_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    active_follow_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end

  private
    # Reprocess Papaerclip cropping for custom crop
    def reprocess_profile_pic
      profile_pic.assign(profile_pic)
      profile_pic.save
      #profile_pic.reprocess!
    end
end
