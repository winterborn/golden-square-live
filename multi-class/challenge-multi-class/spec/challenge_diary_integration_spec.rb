require "challenge_diary"
require "challenge_diary_entry"
require "challenge_entry_reader"
require "challenge_phone_book"

RSpec.describe "Integration" do
  it "adds diary entries to list and returns list" do
    diary = Diary.new
    entry = DiaryEntry.new("my title", "my contents")
    diary.add(entry)
    expect(diary.list).to eq [entry]
  end

  describe "reading behaviour" do
    context "readable within time" do
      it "reads within time given" do
        diary = Diary.new
        entry_reader = EntryReader.new(2, diary)
        entry_1 = DiaryEntry.new("my title", "my contents")
        entry_2 = DiaryEntry.new("my title", "my contents goes on")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(entry_reader.entry_readable_in_given_time(1)).to eq entry_1
      end
    end

    context "not readable within time given" do
      it "does not read - returns nil" do
        diary = Diary.new
        entry_reader = EntryReader.new(2, diary)
        entry = DiaryEntry.new("my title", "I had shreddies for breakfast.")
        diary.add(entry)
        expect(entry_reader.entry_readable_in_given_time(1)).to eq nil
      end
    end

    context "wpm = 0" do
      it "fails" do
        diary = Diary.new
        entry_reader = EntryReader.new(0, diary)
        entry = DiaryEntry.new("my title", "Monday morning")
        diary.add(entry)
        expect {
          entry_reader.entry_readable_in_given_time(1)
        }.to raise_error "wpm cannot be 0."
      end
    end
  end

  describe "#phone_book" do
    it "shows numbers" do
      diary = Diary.new
      phone_book = PhoneBook.new(diary)
      entry_1 = DiaryEntry.new("my title", "Phil's number is 07791165000")
      entry_2 = DiaryEntry.new("my title", "Kat's number is 07792235000")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(phone_book.numbers).to eq %w[07791165000 07792235000]
    end
  end
end
