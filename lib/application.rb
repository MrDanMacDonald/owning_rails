require 'action_controller'
require 'application_controller'
require 'active_record'
require 'router'
require 'config/routes'

class Application

  # To call the app => @app.call
  # Call takes one argument env, the request info hash as an argument
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name)

    # Create new instance of controller class
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process action_name

    response.finish
  end

  def route(path)

    # # /home/index => ['', 'controller_name', 'action_name']
    # _, controller, action = path.split('/')

    # # Or Operator => If value on the left is nil, assigns value on rights
    # [controller || 'home', action || 'index']

    # Alternate
    Routes.recognize(path)
  end

  def load_controller_class(name)

    # const_get checks for a constant with the given name
    # If found, it returns the value of the constant
    # If not, returns a name error

    # Note that the below poses a security risk as the constant name
    # Comes from the url and a hacker could pass malicious code into the url
    # You're giving access to your classes to the outside world

    require "app/controllers/#{name}_controller"

    Object.const_get name.capitalize + 'Controller'
  end
end
