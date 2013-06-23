# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Arecipe::Application.initialize!

require "memcached/rails"
Arecipe::Application.config.cache_store = Memcached::Rails.new(:servers => ['127.0.0.1'])