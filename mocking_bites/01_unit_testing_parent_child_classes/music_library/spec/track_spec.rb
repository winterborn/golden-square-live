require "track"

RSpec.describe Track do
  it "constructs" do
    track = Track.new("Blinding Lights", "The Weekend")
    expect(track.title).to eq "Blinding Lights"
    expect(track.artist).to eq "The Weekend"
  end

  it "returns true if keyword matches title" do
    track = Track.new("Blinding Lights", "The Weekend")
    expect(track.matches?("Blind")).to eq true
  end

  it "returns true if keyword matches artist" do
    track = Track.new("Blinding Lights", "The Weekend")
    expect(track.matches?("The Weekend")).to eq true
  end

  it "does not match when keyword is present in neither" do
    track = Track.new("Blinding Lights", "The Weekend")
    expect(track.matches?("Jackson")).to eq false
  end
end
