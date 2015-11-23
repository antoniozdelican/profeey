class AddIndexToProfessionsUsers < ActiveRecord::Migration
  def change
    add_index :professions_users, [:profession_id, :user_id], unique: true
  end
end
