# class Router

#   def initialize
#     @paths = {}
#   end

#   def get(path, &block)
#     @paths[path.downcase] = block
#   end

#   def call(env)
#     if @paths.has_key?(env['PATH_INFO'].downcase) 
#        @paths[env['PATH_INFO'].downcase].call
#     else
#       'Not Found'
#     end
#   end

#   def routes(&block)
#     instance_eval &block
#   end
# end

# router = Router.new

# router.routes do 
#   # Remember, this is a block
#   get '/hi' do 
#     'Hi'
#   end
# end

# class App

#   def initialize(router)
#     @router = router
#   end

#   def call(env)
#     [
#       200,
#       { 'Content-Type' => 'text/html' },
#       [@router.call(env)]
#     ]
#   end
# end

# run App.new(router)

require ::File.expand_path('../lib/boot',  __FILE__)
require 'application.rb'
run Application.new

