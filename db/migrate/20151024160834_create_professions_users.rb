class CreateProfessionsUsers < ActiveRecord::Migration
  def change
    create_table :professions_users, id: false do |t|
      t.belongs_to :profession, index: true
      t.belongs_to :user, index: true
    end
  end
end
