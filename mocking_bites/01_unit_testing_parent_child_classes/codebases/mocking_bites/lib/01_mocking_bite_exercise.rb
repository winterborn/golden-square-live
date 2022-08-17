class TaskFormatter
  def initialize(task) # task is an instance of Task
    @task = task
  end

  def format
    # Returns the task formatted as a string.
    # If the task is not complete, the format is:
    # - [ ] Task title
    # If the task is complete, the format is:
    # - [x] Task title
    fail if @task.title.empty?
    return "[ ] #{@task.title}" if @task.complete? == false
    return "[x] #{@task.title}" if @task.complete?
  end
end
