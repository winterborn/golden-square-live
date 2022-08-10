# method reading_time takes (word_total) integer as argument
def reading_time(word_total)
  if word_total == nil
    fail "You didn't provide a word count!"
  elsif word_total.to_i.negative?()
    fail "No negative word counts, please!"
  elsif word_total.class == String
    fail "Please provide a number for the word count."
  elsif word_total.class == Float
    fail "Please enter a whole number."
  elsif word_total.class == Integer
    if word_total == 0
      fail "0 words not allowed!"
    elsif word_total > 0 && word_total < 200
      return(
        "#{word_total} words will take you less than a minute to read at 200 wpm."
      )
    elsif word_total == 200
      return(
        "#{word_total} words will take you 0 hours and 1 minute to read at 200 wpm."
      )
    elsif word_total > 200
      time_to_read_mins = (word_total / 200)
      time_to_read_hours = time_to_read_mins / 60
      left_over_mins = time_to_read_mins - (time_to_read_hours.floor * 60)
      return(
        "#{word_total} words will take you #{time_to_read_hours} hours and #{left_over_mins} minutes to read at 200 wpm."
      )
    else
      return "test"
    end
  end
end

# p reading_time("Prisoner of Azkaban")
# local variable reading_speed needed to convert word_total to time_to_read
# reading_speed = 200
# time_to_read = word_total / reading_speed
# convert time_to_read to hours and minutes
# returns time_to_read, printing "#{word_total} words will take you X hours
# and Y minutes to read at #{reading_speed} wpm."
