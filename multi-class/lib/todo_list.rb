# File: lib/todo_list.rb
class TodoList
  def initialize
    @list = []
  end

  def add(todo)
    return @list << todo
  end

  def incomplete
    incomplete_tasks = @list.select { |task| task.done? == false }
    return incomplete_tasks.map { |tasks| tasks.task }
    # return @list
  end

  def complete
    # Returns all complete todos
    completed_tasks = @list.select { |task| task.done? == true }
    return completed_tasks.map { |tasks| tasks.task }
  end

  def give_up!
    # Marks all todos as complete
    return @list.each { |task| task.mark_done! }
    # for each item in the list, iterate through and change the task to complete
  end
end
