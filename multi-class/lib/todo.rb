# File: lib/todo.rb
class Todo
  def initialize(task)
    # task is a string
    @task = task
    @complete = false
  end

  def task
    # Returns the task as a string
    return @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @complete = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    if @complete == true
      return true
    else
      return false
    end
  end
end
