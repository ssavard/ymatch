class User < ActiveRecord::Base
  has_many :relationships
  has_many :reviews
  has_many :business, through: :reviews
end
