class Router
  # The initialize method gets called on Object.new
  def initialize(&block)
    @paths = {}
    instance_eval &block
  end

  def match(path)
    # Remember that path is a hash value
    # The update method adds a hash value to an existing hash
    @paths.update(path)
  end

  def recognize(path)
    if @paths.has_key?(path)
      controller, action = @paths[path].split('#')
    end
  end
end