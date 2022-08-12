require "music_app"

RSpec.describe MusicApp do
  it "fails due to empty track name" do
    music_app = MusicApp.new
    expect { music_app.add("") }.to raise_error "Cannot have empty track name."
  end

  context "add one track to list." do
    it "adds track to list." do
      music_app = MusicApp.new
      music_app.add("Beat It")
      expect(music_app.list).to eq ["Beat It"]
    end
  end

  context "add two tracks to list." do
    it "adds tracks to list." do
      music_app = MusicApp.new
      music_app.add("Beat It")
      music_app.add("Thriller")
      expect(music_app.list).to eq ["Beat It", "Thriller"]
    end
  end
end
