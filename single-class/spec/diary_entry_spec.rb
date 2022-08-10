require "diary_entry"

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "my_contents"
  end

  describe "#count_words" do
    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("my_title", "some words here")
      expect(diary_entry.count_words).to eq 3
    end

    it "returns zero when contents is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe "#reading_time" do
    context "given a wpm of some sensible number (200)" do
      it "returns .ceil of number of minutes it takes to read contents" do
        diary_entry = DiaryEntry.new("my_title", "one " * 550)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end

    context "given a wpm of 0" do
      it "fails" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect {
          diary_entry.reading_time(0)
        }.to raise_error "Reading speed must be above 0"
      end
    end
  end

  describe "#reading_chunk" do
    context "with a contents readable within given minutes" do
      it "returns full contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        result = diary_entry.reading_chunk(200, 1)
        expect(result).to eq "one two three"
      end
    end

    context "given a wpm of 0" do
      it "fails" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect {
          diary_entry.reading_chunk(0, 5)
        }.to raise_error "Reading speed must be above 0"
      end
    end

    context "with a contents unreadable within given minutes" do
      it "returns readable contents chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "one two"
      end

      it "returns readable contents chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "three"
      end

      it "restart after reading all contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "one two"
      end

      it "restarts if finishes exactly on the end" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(1, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "one two"
      end
    end
  end
end
