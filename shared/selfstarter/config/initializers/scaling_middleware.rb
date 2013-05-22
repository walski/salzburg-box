class ScalingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now

    arr = [200, {'Content-Type' => 'text/plain'}, ['Salzburg']]
    log_time(start_time)
    arr
  end

  def log_time(start_time)
    File.open('log/scaling.log', 'a'){|file| file.write("Current Request Time: " + (Time.now-start_time).to_s + "\n" )}
  end
end

Selfstarter::Application.config.middleware.use ScalingMiddleware
