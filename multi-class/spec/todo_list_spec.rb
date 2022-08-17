require "todo_list"

RSpec.describe TodoList do
  it "returns empty list for incomplete" do
    todo_list = TodoList.new
    expect(todo_list.incomplete).to eq []
  end

  it "returns empty list for complete" do
    todo_list = TodoList.new
    expect(todo_list.complete).to eq []
  end
end
