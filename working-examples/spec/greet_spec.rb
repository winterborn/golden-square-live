require "greet"

RSpec.describe "greet method" do
  it "greets given user with 'Hello, ... !'" do
    result = greet("Phil")
    expect(result).to eq "Hello, Phil!"
  end
end
