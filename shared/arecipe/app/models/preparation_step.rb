class PreparationStep < ActiveRecord::Base
  attr_accessible :duration, :instructions, :recipe_id

  belongs_to :recipe
end
