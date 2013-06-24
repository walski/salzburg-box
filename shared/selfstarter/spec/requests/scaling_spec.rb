require 'spec_helper'

describe "The Scaling Middleware" do
  
  before do
    @log_path = File.join(Rails.root, 'log/scaling.log')
    File.open(@log_path, 'w') {}
    
    3.times do
      get '/scaling/'
    end
  end

  it "logs everything to log/scaling.log" do
    lines = File.read(@log_path).split("\n")
    lines.length.should eq 3
    lines.each do |line|
      time = line.to_f
      time.should > 0
      time.should < 0.5
    end
  end
  
  it "has an average response time of < 0.1" do
    p = ScalingParser.new
    p.mean.should < 0.1
  end
end