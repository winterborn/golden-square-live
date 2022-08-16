require "music_library"

RSpec.describe MusicLibrary do
  it "constructs" do
    music_library = MusicLibrary.new
    expect(music_library.all).to eq []
  end

  it "adds and lists tracks" do
    music_library = MusicLibrary.new
    track_1 = double :track
    track_2 = double :track
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end

  it "searches tracks by title" do
    music_library = MusicLibrary.new
    # track_1 = Track.new("Africa", "Toto")
    # track_2 = Track.new("Blinding Lights", "The Weekend")
    track_1 = double :track
    expect(track_1).to receive(:matches?).with("Weekend").and_return(false)
    track_2 = double :track
    expect(track_2).to receive(:matches?).with("Weekend").and_return(true)
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search("Weekend")).to eq [track_2]
  end
end
