class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :user_yid
      t.string :friend_yid
      t.decimal :match

      t.timestamps null: false
    end
    add_index :relationships, :user_yid
    add_index :relationships, :friend_yid
  end
end
