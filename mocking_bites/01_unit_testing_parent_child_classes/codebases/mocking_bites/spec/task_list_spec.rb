require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it "returns the list of tasks as an array" do
    task_list = TaskList.new
    task_1 = double :task1
    task_2 = double :task2
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end
  it "returns false if task empty otherwise true" do
    task_list = TaskList.new
    task_1 = double :task1
    task_2 = double :task2
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_1).to receive(:complete?).and_return(true)
    expect(task_2).to receive(:complete?).and_return(true)
    expect(task_list.all_complete?).to eq true
  end
  it "returns false if task empty otherwise true" do
    task_list = TaskList.new
    task_1 = double :task, title: "title_1"
    task_2 = double :task, title: "title_2"
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_1).to receive(:complete?).and_return(true)
    expect(task_2).to receive(:complete?).and_return(false)
    expect(task_list.all_complete?).to eq false
  end
end
