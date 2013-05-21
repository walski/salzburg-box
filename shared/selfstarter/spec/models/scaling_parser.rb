describe ScalingParser do
  before do
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