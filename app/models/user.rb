class User < ActiveRecord::Base  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  
  has_and_belongs_to_many :professions
end
