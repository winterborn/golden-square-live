class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthest_point_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.length
  end

  def reading_time(wpm)
    fail "Reading speed must be above 0" unless wpm > 0
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    fail "Reading speed must be above 0" unless wpm > 0
    words_we_can_read = wpm * minutes
    start_from = @furthest_point_read
    end_at = @furthest_point_read + words_we_can_read
    word_list = words[start_from, end_at]
    @furthest_point_read = end_at

    if end_at >= count_words
      @furthest_point_read = 0
    else
      @furthest_point_read = end_at
    end
    return word_list.join(" ")
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end

  private

  def words
    @contents.split(" ")
  end
end
