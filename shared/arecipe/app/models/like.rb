class Like < ActiveRecord::Base
  attr_accessible :recipe_id, :user_id

  validates :recipe_id, :uniqueness => {:scope => :user_id}, :presence => true
  validates :user_id, :presence => true

  belongs_to :recipe
  belongs_to :user
end
