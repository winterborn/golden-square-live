require "calculator"

RSpec.describe InteractiveCalculator do
  it "subtracts two numbers using terminal input" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with(
      "Hello. I will subtract two numbers."
    ).ordered
    expect(terminal).to receive(:puts).with("Please enter a number:").ordered
    expect(terminal).to receive(:gets).and_return("9").ordered
    expect(terminal).to receive(:puts).with(
      "Please enter another number:"
    ).ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("9 - 4 = 5").ordered
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.start
  end
end
