class ScalingParser

  def initialize
    @data = File.read(File.join(Rails.root, 'log/scaling.log')).split('\n')
  end

  def mean
    @data.map(&:to_f).sum(0.0) / @data.length.to_f
  end

end