class Router
  def initialize(&block)
    @paths = {}
    instance_eval &block
  end

  def match(path)
    @paths.update(path)
  end

  def recognize(path)
    if @paths.has_key?(path)
      controller, action = @paths[path].split('#')
    end
  end
end