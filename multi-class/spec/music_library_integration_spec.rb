require "music_library"
require "track"

RSpec.describe "integration" do
  context "when we add a track to library" do
    it "comes back in the list" do
      music_library = MusicLibrary.new
      track = Track.new("Feeling This", "blink-82")
      music_library.add(track)
      expect(music_library.all).to eq [track]
    end
  end

  context "when we add multiple tracks to library" do
    it "comes back in the list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Feeling This", "blink-82")
      track_2 = Track.new("Africa", "Toto")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context "with some tracks added" do
    it "searches for tracks by full title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Feeling This", "blink-82")
      track_2 = Track.new("Africa", "Toto")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("Feeling This")
      expect(result).to eq [track_1]
    end

    it "searches for tracks by partial title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Feeling This", "blink-82")
      track_2 = Track.new("Africa", "Toto")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("Feel")
      expect(result).to eq [track_1]
    end
  end

  context "where there are no tracks matching" do
    it "yeilds an empty list when searching" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Feeling This", "blink-82")
      music_library.add(track_1)
      result = music_library.search_by_title("Not Now")
      expect(result).to eq []
    end
  end
end
