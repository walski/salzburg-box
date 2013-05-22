require 'net/http'
require 'uri'

require 'spec_helper'

describe "The Scaling Middleware" do
  before do
    @log_path = File.join(Rails.root, 'log/scaling.log')
    File.open(@log_path, 'w') {}
  end

  it "logs everything to log/scaling.log" do
    3.times {get '/scaling/'}

    lines = File.read(@log_path).split("\n")
    lines.length.should eq 3
    lines.each do |line|
      time = line.to_f
      time.should > 0.0
      time.should < 0.5
    end
  end
end

def get url
  uri = URI.parse("http://localhost:3000"+url)
  Net::HTTP.get_response(uri)
end
