class PhoneBook
  def initialize(diary)
    # diary is an instance of Diary
    # see a list of all of the mobile phone numbers in all my diary entries
    @diary = diary
  end

  def numbers
    # list of numbers as strings
    @diary.list.map { |entry| numbers_only(entry) }.flatten
  end

  def numbers_only(entry)
    return entry.contents.scan(/07[0-9]{9}/)
  end
end
