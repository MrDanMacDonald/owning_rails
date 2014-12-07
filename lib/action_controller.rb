require 'filtering'
require 'rendering'

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action_name)
      # Send sends a message to an object instance and its ancestors in class hierarchy until some method reacts
      send action_name
    end
  end

  class Base < Metal
    include Filtering
    include Rendering
  end
end
