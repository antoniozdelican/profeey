class CreateFollowRelationships < ActiveRecord::Migration
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id, index: true
      t.integer :followed_id, index: true

      t.timestamps null: false
    end
    add_index :follow_relationships, [:follower_id, :followed_id], unique: true
  end
end
