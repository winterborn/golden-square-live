require 'task_tracker'

RSpec.describe TaskTracker do

    it "has an empty list" do
        tasttracker = TaskTracker.new
        expect(tasttracker.list).to eq []
    end

    it "adds a task to the to-do list" do
        tasttracker = TaskTracker.new
        tasttracker.add("walk the dog")
        tasttracker.add("walk the cat")
        expect(tasttracker.list).to eq ["walk the dog", "walk the cat"]
    end


    it "adds a task to the to-do list" do
        tasttracker = TaskTracker.new
        tasttracker.add("walk the dog")
        expect(tasttracker.list).to eq ["walk the dog"]
    end

    it "returns uncompleted task" do
        tasktracker = TaskTracker.new
        tasktracker.add("walk the dog")
        tasktracker.add("walk the cat")
        tasktracker.completed("walk the dog")
        expect(tasktracker.list).to eq ["walk the cat"]
    end

    it "fails when trying to complete a task that doesn't exist" do
        tasktracker = TaskTracker.new
        tasktracker.add("walk the dog")
        tasktracker.add("walk the cat")
        expect{tasktracker.completed("walk the rabbit")}.to raise_error "no such task"
    end

end