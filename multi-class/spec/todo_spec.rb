require "todo"

RSpec.describe Todo do
  describe "constructs" do
    it "returns the task as a string" do
      todo = Todo.new("Buy eggs")
      expect(todo.task).to eq "Buy eggs"
    end
  end

  describe "Checking status of mark_done and / or done?" do
    it "done? has a default 'complete' status of false" do
      todo = Todo.new("Wash the car")
      expect(todo.done?).to eq false
    end
    it "Uses mark_done to change 'complete' status to true and returns true" do
      todo = Todo.new("Sort laundry")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
end
