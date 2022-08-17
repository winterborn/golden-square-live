require "challenge_task"

RSpec.describe Task do
  it "constructs" do
    todo_1 = Task.new("")
    expect(todo_1).to eq todo_1
  end
end
