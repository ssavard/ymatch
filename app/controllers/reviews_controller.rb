class ReviewsController < ApplicationController
  def new
  end
  
  def index
    @reviews = Review.limit(20)
  end
end
