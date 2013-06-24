require 'net/http'
require 'uri'

describe ScalingParser do
  before do

    3.times do
      Process.fork{ get '/scaling/' }
    end
    Process.wait

    @log_path = File.join(Rails.root, 'log/scaling.log')
    File.open(@log_path, 'w') do |file|
      file.puts "0.3"
      file.puts "0.3"
      file.puts "0.8"
      file.puts "0.2"
    end
  end

  it "calculates the mean" do
    ScalingParser.new.mean.should be_within(0.01).of(0.4)
  end
end


def get url
  uri = URI.parse("http://localhost:3000"+url)
  Net::HTTP.get_response(uri)
end
