class GrammarStats
  def initialize
    @count_total = 0.0
    @count_correct = 0.0
    @count_incorrect = 0.0
  end

  def check(text)
    fail "Error, string cannot be empty." if text.empty?
    first_letter_is_uppercase = text[0] == text[0].upcase
    last_character_is_punctuation = %w[. ! ?].include? text[-1]
    if first_letter_is_uppercase && last_character_is_punctuation
      @count_total += 1
      @count_correct += 1
      return true
    else
      @count_total += 1
      @count_incorrect += 1
      return false
    end
  end

  def percentage_good
    # Returns as an integer of the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    percent_correct = (@count_correct / @count_total) * 100
    return percent_correct
  end
end
