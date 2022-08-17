class Task
  def initialize(todo)
    @todo = todo
  end

  def todo
    @todo << todo
  end
end
