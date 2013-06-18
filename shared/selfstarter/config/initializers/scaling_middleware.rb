class ScalingMiddleware
	def initialize(app)
		@app = app
	end

	def call(env)
		log_path = File.join(Rails.root, 'log/scaling.log')
		start = Time.now
		status, headers, response = @app.call(env)
		stop = Time.now - start
		log = File.open(log_path, 'a')
		log << "#{stop}\n"
		log.close
		[status, headers, response]
	end
end

Selfstarter::Application.config.middleware.use ScalingMiddleware