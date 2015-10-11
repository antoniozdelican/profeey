class Profession < ActiveRecord::Base
  validates :name, uniqueness: true
end
