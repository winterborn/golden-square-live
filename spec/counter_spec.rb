require "counter"

# We use the class name here rather than a string
RSpec.describe Counter do
  it "initially reports a count of zero." do
    counter = Counter.new
    result = counter.report
    expect(result).to eq "Counted to 0 so far."
  end

  it "reports a count of added values with one addition." do
    counter = Counter.new
    counter.add(10)
    result = counter.report
    expect(result).to eq "Counted to 10 so far."
  end

  it "reports a count of all added values." do
    counter = Counter.new
    counter.add(10)
    counter.add(20)
    counter.add(5)
    result = counter.report
    expect(result).to eq "Counted to 35 so far."
  end
end
