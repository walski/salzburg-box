require 'net/http'
require 'uri'
require './config/environment.rb'

3.times do
  Process.fork do
    uri = URI.parse('http://localhost:3000/scaling/')
    Net::HTTP.get_response(uri)
  end
end
Process.wait

p = ScalingParser.new
puts "Mean Time: #{p.mean}s"

