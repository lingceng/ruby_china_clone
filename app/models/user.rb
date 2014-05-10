class User < ActiveRecord::Base
  has_many :topics

  validates :name, :email, presence: true 
 
end
