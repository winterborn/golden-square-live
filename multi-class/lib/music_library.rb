# File: lib/music_library.rb

class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks << track

    # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    return @tracks
  end

  def search_by_title(keyword)
    return @tracks.select { |track| track.title.include?(keyword) }

    # keyword is a string
    # Returns a list of tracks with titles that include the keyword
  end
end
