class EntryReader
  def initialize(wpm, diary)
    @wpm = wpm
    @diary = diary
  end

  def entry_readable_in_given_time(time)
    fail "wpm cannot be 0." unless @wpm.positive?
    readable = @diary.list.reject { |entry| read_time(entry) > time }
    return readable.max_by { |entry| word_count(entry) }
  end

  def read_time(entry)
    return (word_count(entry) / @wpm.to_f).ceil
  end

  def word_count(entry)
    return entry.contents.split(" ").length
  end
end
