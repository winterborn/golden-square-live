require "e_extractor"

RSpec.describe "e_extractor method" do
  it "given an empty string, return empty string" do
    result = e_extractor("")
    expect(result).to eq ""
  end

  it "given a string without any 'e' in it, return same string" do
    result = e_extractor("ghost")
    expect(result).to eq "ghost"
  end

  it "given a string with an 'e' in it, brings to start of string" do
    result = e_extractor("nintendo")
    expect(result).to eq "enintndo"
  end

  it "given a string with multiple 'e' in it, brings all to start of string" do
    result = e_extractor("teeth")
    expect(result).to eq "eetth"
  end
end
