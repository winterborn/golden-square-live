require "task"

RSpec.describe Task do
  it "constructs" do
    task = Task.new("Walk the dog")
    expect(task.title).to eq "Walk the dog"
  end

  it "can be marked as complete" do
    task = Task.new("Walk the dog")
    task.mark_complete
    expect(task.complete?).to eq true
  end

  it "shows incomplete tasks as false, complete tasks as true" do
    task_1 = Task.new("Make dinner")
    task_2 = Task.new("Complete coding")
    task_1.mark_complete
    expect(task_1.complete?).to eq true
    expect(task_2.complete?).to eq false
  end
end
