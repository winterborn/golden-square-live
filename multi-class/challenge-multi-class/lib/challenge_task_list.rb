class TaskList
  def initialize
    @all_tasks = []
  end

  def add(task)
    @all_tasks << task
  end

  def list
    return @all_tasks
  end
end
