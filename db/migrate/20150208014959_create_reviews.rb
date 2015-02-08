class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :business_yid
      t.string :user_yid
      t.decimal :stars
      t.string :text
      t.string :date

      t.timestamps null: false
    end
    add_index :reviews, :business_yid
    add_index :reviews, :user_yid
  end
end
