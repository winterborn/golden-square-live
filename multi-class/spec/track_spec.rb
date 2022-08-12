require "track"

RSpec.describe Track do
  it "constructs" do
    track = Track.new("Feeling This", "blink-182")
    expect(track.title).to eq "Feeling This"
    expect(track.artist).to eq "blink-182"
  end

  describe "#format" do
    it "formats title and artist into a string" do
      track = Track.new("Feeling This", "blink-182")
      expect(track.format).to eq "'Feeling This' by blink-182"
    end
  end
end
