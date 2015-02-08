class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :user_yid
      t.string :fellow_yid
      t.decimal :match_score
      t.integer :fellow_reviews
      t.integer :common_review
      t.decimal :average

      t.timestamps null: false
    end
    add_index :matches, :user_yid
    add_index :matches, :fellow_yid
  end
end
