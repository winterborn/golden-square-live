require "challenge_task_list"
require "challenge_task"

RSpec.describe TaskList do
  it "adds tasks, returns list of tasks" do
    task_list = TaskList.new
    todo_1 = Task.new("Buy milk")
    todo_2 = Task.new("Buy eggs")
    todo_3 = Task.new("Buy flour")
    task_list.add(todo_1)
    task_list.add(todo_2)
    task_list.add(todo_3)
    expect(task_list.list).to eq [todo_1, todo_2, todo_3]
  end
end
