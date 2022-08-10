require "make_snippet"

RSpec.describe "make_snippet method" do
  it "if given an empty string, returns empty string" do
    result = make_snippet("")
    expect(result).to eq ""
  end

  it "given a string with five or less words, returns same string" do
    result = make_snippet("The quick brown fox")
    expect(result).to eq "The quick brown fox"
  end

  it "given a string with more than five words, returns first five words and '...'" do
    result = make_snippet("The quick brown fox jumped over the lazy dog")
    expect(result).to eq "The quick brown fox jumped..."
  end
end
