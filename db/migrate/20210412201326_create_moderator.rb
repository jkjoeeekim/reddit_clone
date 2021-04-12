class CreateModerator < ActiveRecord::Migration[5.2]
  def change
    create_table :moderators do |t|
      t.integer :sub_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :moderators, :user_id
  end
end
