class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true 
  has_and_belongs_to_many :professions
  #accepts_nested_attributes_for :professions, reject_if: :check_profession
  accepts_nested_attributes_for :professions

  

  def professions_attributes=(hash)
    hash.each do |sequence, profession_values|
      if !professions.where(name: profession_values[:name]).any?
        # hack redo this later!!!
        professions.destroy_all
        professions << Profession.find_or_create_by(name: profession_values[:name])
      end
    end
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
