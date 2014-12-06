require 'action_controller'
require 'application_controller'
require 'active_record'
require 'router'
require 'config/routes'

class Application

  # To call the app => @app.call
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name) # HomeController
    controller = controller_class.new # HomeController.new
    controller.request = request
    controller.response = response
    controller.process action_name # calls: controller.index

    response.finish
  end

  def route(path)
    # /home/index => ['', 'controller_name', 'action_name']
    _, controller, action = path.split('/')
    # Or Operator => If value on the left is nil, assigns value on rights
    [controller || 'home', action || 'index']
  end

  def load_controller_class(name)
    capitalized_name = name.capitalize
    "#{capitalized_name}Controller"
  end
end
