require "check_codeword"

RSpec.describe "check_codeword method" do
  it "returns a wrong message if given the wrong codeword" do
    result = check_codeword("yellow")
    expect(result).to eq "WRONG!"
  end

  it "returns a close message if codeword's first character is 'h' and last character is 'e" do
    result = check_codeword("house")
    expect(result).to eq "Close, but nope."
  end

  it "returns a correct message if codeword is correct" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end

  # edge cases
  it "returns a wrong message if given the wrong codeword with just correct first character" do
    result = check_codeword("holiday")
    expect(result).to eq "WRONG!"
  end

  it "returns a wrong message if given the wrong codeword with just correct last character" do
    result = check_codeword("poke")
    expect(result).to eq "WRONG!"
  end
end
