require "music_library"
require "track"

RSpec.describe "Integration" do
  it "adds track to library, returns list of added tracks" do
    track = Track.new("Africa", "Toto")
    music_library = MusicLibrary.new
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

  it "adds multiple tracks to library, returns list of added tracks" do
    track_1 = Track.new("Africa", "Toto")
    track_2 = Track.new("Blinding Lights", "The Weekend")
    music_library = MusicLibrary.new
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end

  describe "#search method" do
    it "return tracks that match keyword" do
      track_1 = Track.new("Africa", "Toto")
      track_2 = Track.new("Blinding Lights", "The Weekend")
      music_library = MusicLibrary.new
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("Weekend")).to eq [track_2]
    end
  end
end
