class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_yid
      t.string :name
      t.string :neighborhoods
      t.string :full_address
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.decimal :stars
      t.integer :review_count
      t.string :categories

      t.timestamps null: false
    end
  end
end
