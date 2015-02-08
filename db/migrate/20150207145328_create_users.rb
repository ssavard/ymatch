class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_yid
      t.string :user_name
      t.integer :review_count
      t.decimal :average_stars
      t.integer :votes
      t.string :elite
      t.string :yelping_since
      t.integer :fans

      t.timestamps null: false
    end
    add_index :users, :user_yid, unique: true
  end
end
