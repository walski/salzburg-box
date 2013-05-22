require 'net/http'
require 'uri'
require './config/environment.rb'

10.times do
  10.times do
    Process.fork do
      uri = URI.parse("http://localhost:3000/scaling/")
      Net::HTTP.get_response(uri)
    end
  end
  Process.wait
end

p = ScalingParser.new
puts p.mean

