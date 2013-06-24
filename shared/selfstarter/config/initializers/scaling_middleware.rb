class ScalingMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now

    status, header, response = @app.call(env)
    
    File.open(File.join(Rails.root, 'log/scaling.log'), 'a') do |file|
      file.write("#{Time.now - start}\n")
    end

    [status, header, response]
  end

end

Selfstarter::Application.config.middleware.use ScalingMiddleware