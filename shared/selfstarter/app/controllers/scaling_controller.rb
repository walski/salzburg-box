class ScalingController < ApplicationController
  def index
  end

  def login
  end

  def do_login
    session[:user] = params[:user]
    sleep 0.5

    redirect_to :action => :secured
  end

  def logout
    session.delete :user
    redirect_to :action => :index
  end

  def secured
    redirect_to :action => :login and return unless session[:user]

    sleep(3 + (rand * 0.2)) if rand > 0.95
  end

  def datadata
    # Write data
    rand(100).times do
      data = (0...200).map{ random_character }.join
      Dummy.create!(:data => data, :number => random_number)
    end

    @results = []
    # Read data
    rand(100).times do
      word = ''
      rand(3).times {word << random_character}
      @results << Dummy.where(Dummy.arel_table[:data].matches("#{word}%"))
    end

    # Destroy data
    rand(100).times do
      Dummy.where(:number => random_number).first.try(:destroy)
    end
  end

  def recipes
    @recipes = Recipe.all
  end

  protected
  def random_number
    rand(100)
  end

  def random_character
    ('a'..'z').to_a[rand(26)]
  end
end