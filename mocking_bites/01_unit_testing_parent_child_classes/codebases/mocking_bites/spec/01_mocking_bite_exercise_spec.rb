require "01_mocking_bite_exercise"

RSpec.describe TaskFormatter do
  it "#format method returns task formatted as string" do
    task = double(:task, title: "title1", complete?: true, mark_complete: true)
    # allow(task).to receive(:complete?).and_return(true)
    # allow(task).to receive(:mark_complete).and_return(true)
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[x] title1"
  end

  it "#format method returns task formatted as string" do
    task =
      double(:task, title: "title2", complete?: false, mark_complete: false)
    # allow(task).to receive(:complete?).and_return(true)
    # allow(task).to receive(:mark_complete).and_return(true)
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[ ] title2"
  end

  it "#format method raises error if empty string" do
    task = double(:task, title: "")
    task_formatter = TaskFormatter.new(task)
    expect { task.format }.to raise_error RSpec::Mocks::MockExpectationError
  end
end
