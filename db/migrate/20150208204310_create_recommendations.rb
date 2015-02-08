class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :user_yid
      t.string :business_yid
      t.decimal :relevance
      t.decimal :match_score
      t.integer :references
      t.integer :reviews
      t.decimal :average_stars
      t.decimal :predicted_stars
      t.string :reviewer_id
      t.integer :reviewer_stars
      t.decimal :reviewer_relevance

      t.timestamps null: false
    end
    add_index :recommendations, :user_yid
    add_index :recommendations, :business_yid
  end
end
