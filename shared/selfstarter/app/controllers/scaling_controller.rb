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

  def numbercrunching
    amount = 2500000
    @primes = prime_sieve_upto(amount)
  end

  def recipes
    # @recipes = Recipe.all
    @recipes = Rails.cache.fetch('all-recipies-and-ingridients') {Recipe.includes(:recipie_ingridients).all}
  end

  protected
  def random_number
    rand(100)
  end

  def random_character
    ('a'..'z').to_a[rand(26)]
  end

  # From: http://blog.marc-seeger.de/2010/12/05/prime-numbers-in-ruby/
  def prime_sieve_upto(n)
    all_nums = (0..n).to_a
    all_nums[0] = all_nums[1] = nil
    all_nums.each do |p|
      #jump over nils
      next unless p
      #stop if we're too high already
      break if p * p > n
      #kill all multiples of this number
      (p*p).step(n, p){ |m| all_nums[m] = nil }
    end
    #remove unwanted nils
    all_nums.compact
  end
end