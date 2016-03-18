require "rulers/version"
require "rulers/routing"
require "rulers/util.rb"
require "rulers/dependencies.rb"

module Rulers
	class Application
		def call(env)

			if env['PATH_INFO'] == '/favicon.ico'
				return [404, {'Content-Type' => 'text/html'}, []]
			end

			if env['PATH_INFO'] == '/'
				return [303, {'Location' => '/quotes/a_quote'}, []]
			end

		  klass, act = get_controller_and_action(env)
		  controller = klass.new(env)
		  
			
      begin
      	text = controller.send(act)
      	return [200, {'Content-Type' => 'text/html'}, [text]]
      rescue Exception => e
      	return [500, {'Content-Type' => 'text/html'}, [e.message]]
      end
			


		end
	end

	class Controller
		def initialize(env)
			@env = env
		end 

		def env
			@env
		end
	end
end
