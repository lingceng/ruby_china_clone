class User < ActiveRecord::Base
  has_many :topics
  has_many :replies

  validates :name, :email, presence: true 
 
end
