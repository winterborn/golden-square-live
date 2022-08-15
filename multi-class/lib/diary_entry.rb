# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split(" ").length
    # return 0 if @contents.empty?
    # return @contents.count(" ") + 1
  end

  def reading_time(wpm)
    fail "wpm cannot be zero" unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
  end
end
