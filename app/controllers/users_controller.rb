class UsersController < ApplicationController
  def new
  end
  
  def index
    #@users = User.limit(3000)
    @q = User.search(params[:q])
    @q.sorts = 'user_name asc' if @q.sorts.empty?
    @users = @q.result
  end
  
  def show
    @user = User.find(params[:id])
    @relationships = Relationship.where("user_yid = ?", @user.user_yid)
    @reviews = Review.where("user_yid = ?", @user.user_yid)
    @matches = Match.where("user_yid = ?", @user.user_yid)
    @recommendations = Recommendation.where("user_yid = ?", @user.user_yid)
  end
end
