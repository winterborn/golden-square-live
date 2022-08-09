require "count_words"

RSpec.describe "count_words method" do
  it "if given empty string, return empty string" do
    result = count_words("")
    expect(result).to eq 0
  end

  it "given a string, returns number of words in string" do
    result = count_words("the quick brown fox jumped over")
    expect(result).to eq 6
  end
end
