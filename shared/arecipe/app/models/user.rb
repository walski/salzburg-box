class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :recipes, :dependent => :destroy

  has_many :likes
  #has_many :liked_recipes, :through => :likes, :source => :recipe

  def liked_recipes
    recipes.where(:id => likes.pluck(:recipe_id))
  end
end
