class ScalingMiddleware
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    start_time = Time.now
    
    status, header, response = @app.call(env)
    
    File.open(File.join(Rails.root, 'log/scaling.log'), 'a') do |f|
      f.write("#{Time.now - start_time}\n")
    end
    
    [status, header, response]
  end
  
end

Selfstarter::Application.config.middleware.use ScalingMiddleware
