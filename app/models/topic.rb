class Topic < ActiveRecord::Base
  belongs_to :node
  belongs_to :user
  
  validates :title, :content, presence: true 
  validates_presence_of :node, :user

end
