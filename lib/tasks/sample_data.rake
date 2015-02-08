namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    File.open('/Users/ssavard/Documents/Yelp/Hackathon/yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_user_sm.json', 'r') do |file|
      file.each do |line|
        user_attrs = JSON.parse line
        friends_lst = user_attrs["friends"]
        User.create!(user_name: user_attrs["name"],
                         user_yid: user_attrs["user_id"],
                         review_count: user_attrs["review_count"],
                         average_stars: user_attrs["average_stars"],
                         votes: user_attrs["votes"],
                         elite: user_attrs["elite"],
                         yelping_since: user_attrs["yelping_since"],
                         fans: user_attrs["fans"])
        friends_lst.each do |fr|
          Relationship.create!(user_yid: user_attrs["user_id"], friend_yid: fr )
        end
      end
    end
    File.open('/Users/ssavard/Documents/Yelp/Hackathon/yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_business_sm.json.json', 'r') do |file|
      file.each do |line|
        buss_attrs = JSON.parse line
        Business.create!(name: buss_attrs["name"],
                         business_yid: buss_attrs["business_id"],
                         neighborhoods: buss_attrs["neighborhoods"],
                         full_address: buss_attrs["full_address"],
                         city: buss_attrs["city"],
                         state: buss_attrs["state"],
                         latitude: buss_attrs["latitude"],
                         longitude: buss_attrs["longitude"],
                         stars: buss_attrs["stars"],
                         review_count: buss_attrs["review_count"],
                         categories: buss_attrs["categories"])
        
      end
    end
    File.open('/Users/ssavard/Documents/Yelp/Hackathon/yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_review_sm.json', 'r') do |file|
      file.each do |line|
        review_attrs = JSON.parse line
  
        Review.create!(business_yid: review_attrs["business_id"],
                         user_yid: review_attrs["user_id"],
                         stars: review_attrs["stars"],
                         text: review_attrs["text"],
                         date: review_attrs["date"])
        
        
      end
    end
    CSV.foreach("/Users/ssavard/Documents/Yelp/Hackathon/fran/fellows.csv") do |row|
      Match.create(:user_yid => row[0], :fellow_yid => row[1], :match_score => row[2], :fellow_reviews => row[3], :common_review => row[4], :average => row[5])
    end
    CSV.foreach("/Users/ssavard/Documents/Yelp/Hackathon/fran/businesses.csv") do |row|
      Recommendation.create(:user_yid => row[0], :business_yid => row[1], :relevance => row[2], :references => row[3], :match_score => row[4], :reviews => row[5], :average_stars => row[6], :predicted_stars => row[7], :reviewer_id => row[8], :reviewer_stars => row[9], :reviewer_relevance => row[10])
    end
  end
end


