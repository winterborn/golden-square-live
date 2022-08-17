require "challenge_diary"

RSpec.describe Diary do
  it "initially has an empty list" do
    diary = Diary.new
    expect(diary.list).to eq []
  end
end
