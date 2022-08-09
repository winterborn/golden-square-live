require "string_builder"

RSpec.describe StringBuilder do
  context "initially"
  it "initially returns an empty string as output." do
    string_builder = StringBuilder.new
    result = string_builder.output
    expect(result).to eq ""
  end

  it "initially returns length of 0 due to empty string." do
    string_builder = StringBuilder.new
    result = string_builder.size
    expect(result).to eq 0
  end

  # context sets up sub-group
  context "given one addition of a string"
  it "return string as output." do
    string_builder = StringBuilder.new
    string_builder.add("metro")
    result = string_builder.output
    expect(result).to eq "metro"
  end

  it "returns length of string." do
    string_builder = StringBuilder.new
    string_builder.add("metro")
    result = string_builder.size
    expect(result).to eq 5
  end
end
