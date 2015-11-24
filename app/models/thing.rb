class Thing < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, length: { maximum: 2000 }
  strip_attributes only: :description
end
