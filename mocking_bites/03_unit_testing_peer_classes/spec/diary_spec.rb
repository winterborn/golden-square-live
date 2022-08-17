require "diary"

RSpec.describe Diary do
  it "returns contents of diary" do
    diary = Diary.new("Wednesday afternoon it rained in London.")
    expect(diary.read).to eq "Wednesday afternoon it rained in London."
  end
end
