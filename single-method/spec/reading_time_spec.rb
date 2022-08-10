=begin
  reading_time(nil) => "You didn't provide a word count!"
  (no argument error)
  reading_time(-50) => "No negative word counts, please!"
    (negative word_total error)
  reading_time(not_a_num) => "Please provide a number for the word count."
    (non-num error)
  reading_time(float) => "Please enter a whole number, please."
    (decimals error)
  reading_time(0) => "0 words will take you 0 hours and Y minutes to read at 200 wpm."
    (for 0 word count)
  reading_time(59) => "59 words will take you less than a minute to read at 200 wpm."
    (for less than wpm)
  reading_time(200) => "200 words will take you 0 hours and 1 minute to read at 200 wpm."
    (for same as wpm)
  reading_time(201) => "201 words will take you 0 hours and 2 minutes to read at 200 wpm."
    (for rounding up to nearest minute)
  reading_time(6000) => "6000 words will take you 30 hours and 0 minutes to read at 200 wpm."
    (for ~document)
  reading_time (80000) => "10000 words will take you 50 hours and 0 minutes to read at 200 wpm.
    (for ~novel)
=end

require "reading_time"

RSpec.describe "reading_time_method" do
  context "when no argument given" do
    it "fails and gives error" do
      expect {
        reading_time(nil)
      }.to raise_error "You didn't provide a word count!"
    end
  end

  context "negative word counts" do
    it "fails and gives error due to negative word count" do
      expect {
        reading_time(-1)
      }.to raise_error "No negative word counts, please!"
    end
  end

  context "not an integer" do
    it "fails and gives error due to non-numeric value" do
      expect {
        reading_time("Prisoner of Azkaban")
      }.to raise_error "Please provide a number for the word count."
    end
  end

  context "not a whole numnber" do
    it "fails and gives error due to non-whole number" do
      expect { reading_time(1.5) }.to raise_error "Please enter a whole number."
    end
  end

  context "word_total is 0" do
    it "give the reading_time for a text assuming 200wpm" do
      expect { reading_time(0) }.to raise_error "0 words not allowed!"
    end
  end

  context "word_total is 59" do
    it "give the reading_time for a text assuming 200wpm" do
      result = reading_time(59)
      expect(
        result
      ).to eq "59 words will take you less than a minute to read at 200 wpm."
    end
  end

  context "word_total is 200" do
    it "give the reading_time for a text assuming 200wpm" do
      result = reading_time(200)
      expect(
        result
      ).to eq "200 words will take you 0 hours and 1 minute to read at 200 wpm."
    end
  end

  context "word_total is 201" do
    it "give the reading_time for a text assuming 200wpm" do
      result = reading_time(201)
      expect(
        result
      ).to eq "201 words will take you 0 hours and 1 minutes to read at 200 wpm."
    end
  end

  context "word_total for document" do
    it "give the reading_time for a text assuming 200wpm" do
      result = reading_time(6000)
      expect(
        result
      ).to eq "6000 words will take you 0 hours and 30 minutes to read at 200 wpm."
    end
  end

  context "word_total for novel" do
    it "give the reading_time for a text assuming 200wpm" do
      result = reading_time(80_000)
      expect(
        result
      ).to eq "80000 words will take you 6 hours and 40 minutes to read at 200 wpm."
    end
  end

  context "word_total for longest book ever" do
    it "give the reading_time for a text assuming 200wpm" do
      result = reading_time(2_436_924)
      expect(
        result
      ).to eq "2436924 words will take you 203 hours and 4 minutes to read at 200 wpm."
    end
  end
end
