require "fizzbuzz"

RSpec.describe "fizzbuzz method" do
  it "for an ordinary number it returns the number itself" do
    # when I cann fizzbuzz(1), I should get 1.
    result = fizzbuzz(1)
    expect(result).to eq 1
  end

  it "returns fizz if number is divisible by 3" do
    result = fizzbuzz(3)
    expect(result).to eq "fizz"
  end

  it "returns buzz if number is divisible by 5" do
    result = fizzbuzz(10)
    expect(result).to eq "buzz"
  end

  it "returns fizzbuzz if number is divisible by 15" do
    result = fizzbuzz(30)
    expect(result).to eq "fizzbuzz"
  end
end
