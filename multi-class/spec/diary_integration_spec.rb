require "diary"
require "diary_entry"

RSpec.describe "integration" do
  context "after adding entries" do
    it "lists out entries added" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end

    describe "word counting behaviour" do
      it "counts words in all diary entries' contents" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
        diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.count_words).to eq 6
      end
    end

    describe "reading time behaviour" do
      it "fails where wpm is 0" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
        diary.add(diary_entry_1)
        expect { diary.reading_time(0) }.to raise_error "wpm cannot be zero"
      end

      it "calculates reading time for all entries where it fits exactly" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
        diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
      end

      it "calculates reading time for all entries it falls over a minute" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents")
        diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
      end
    end

    # Returns an instance of diary entry representing the entry that is closest
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.

    describe "best reading time behaviour" do
      it "fails where wpm is 0" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents")
        diary.add(diary_entry_1)
        expect {
          diary.find_best_entry_for_reading_time(0, 1)
        }.to raise_error "wpm cannot be zero"
      end

      context "just one entry and it is readable within time" do
        it "returns that entry" do
          diary = Diary.new
          diary_entry_1 = DiaryEntry.new("my title 1", "my contents")
          diary.add(diary_entry_1)
          result = diary.find_best_entry_for_reading_time(2, 1)
          expect(result).to eq diary_entry_1
        end

        context "just one entry and it is unreadable within time" do
          it "returns nil" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title 1", "my contents longer")
            diary.add(diary_entry_1)
            result = diary.find_best_entry_for_reading_time(2, 1)
            expect(result).to eq nil
          end
        end

        context "multiple entries" do
          it "returns longest entry readable within allotted time" do
            diary = Diary.new
            best_entry = DiaryEntry.new("my title 1", "one two")
            diary.add(DiaryEntry.new("my title 1", "one"))
            diary.add(best_entry)
            diary.add(DiaryEntry.new("my title 1", "one two three"))
            diary.add(DiaryEntry.new("my title 1", "one two three four"))
            result = diary.find_best_entry_for_reading_time(2, 1)
            expect(result).to eq best_entry
          end
        end
      end
    end
  end
end
