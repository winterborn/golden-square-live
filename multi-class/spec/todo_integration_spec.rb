require "todo_list"
require "todo"

RSpec.describe "integration" do
  it "Adds instances of Todo and returns incomplete todos" do
    todo_1 = Todo.new("Buy eggs")
    todo_2 = Todo.new("Do washing")
    todo_list = TodoList.new
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    expect(todo_list.incomplete).to eq ["Buy eggs", "Do washing"]
  end

  it "Adds instances of Todo and returns completed tasks" do
    todo_1 = Todo.new("Empty dishwasher")
    todo_2 = Todo.new("Hoover the floor")
    todo_2.mark_done!
    todo_list = TodoList.new
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    expect(todo_list.complete).to eq ["Hoover the floor"]
  end

  it "Adds instances of Todo and returns one incomplete todo with one complete todo" do
    todo_1 = Todo.new("Buy eggs")
    todo_2 = Todo.new("Buy milk")
    todo_2.mark_done!
    todo_list = TodoList.new
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    expect(todo_list.incomplete).to eq ["Buy eggs"]
  end

  describe "#give_up! method" do
    it "Adds Todo instances, changes all to true, returns list of all tasks" do
      todo_1 = Todo.new("Walk the dog")
      todo_2 = Todo.new("Walk the cat")
      todo_2.mark_done!
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.complete).to eq ["Walk the dog", "Walk the cat"]
    end

    it "Adds Todo instances, change all to true, check incomplete list is empty" do
      todo_1 = Todo.new("Unload dishwasher")
      todo_2 = Todo.new("Fill the kettle")
      todo_2.mark_done!
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.incomplete).to eq []
    end
  end
end
