require "todo_list"

RSpec.describe TodoList do
  it "returns empty list when todo is empty" do
    todo = Todo.new("")
    todo_list = TodoList.new
    todo_list.add(todo)
    expect(todo_list.incomplete).to eq [""]
  end
end
