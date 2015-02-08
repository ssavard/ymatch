class BusinessesController < ApplicationController
  def new
  end
  
  def index
    @businesses = Business.limit(20)
  end
  
  def show
    @business = Business.find(params[:id])
    @reviews = Review.where("business_yid = ?", @business.business_yid)
  end
end
