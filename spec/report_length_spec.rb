require "report_length"

RSpec.describe "report_length method" do
  it "checks the length of a given string" do
    result = report_length("Nintendo")
    expect(result).to eq "This string was 8 characters long."
  end
end
