require "diary_entry"

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "my_contents"
  end

  describe "#count_words" do
    it "counts zero words in empty diary entry contents" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end

    it "counts number of words in diary entry contents" do
      diary_entry = DiaryEntry.new("my_title", "one two three four five")
      expect(diary_entry.count_words).to eq 5
    end
  end

  describe "#reading_time" do
    it "fails if wpm is 0" do
      diary_entry = DiaryEntry.new("my_title", "one two three")
      expect { diary_entry.reading_time(0) }.to raise_error "wpm cannot be zero"
    end

    it "returns zero if contents is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.reading_time(2)).to eq 0
    end

    it "returns reading time for contents" do
      diary_entry = DiaryEntry.new("my_title", "one two three four five")
      expect(diary_entry.reading_time(2)).to eq 3
    end
  end
end
