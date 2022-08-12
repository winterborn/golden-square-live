# File: lib/track.rb

class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
    # title and artist are both strings
  end

  def title
    return @title
    # Returns the title as a string
  end

  def artist
    return @artist
  end

  def format
    return "'#{@title}' by #{@artist}"
    # Returns a string of the form "TITLE by ARTIST"
  end
end
