def check_grammar(string)
  fail "Not a sentence." if string.empty?
  first_letter_is_uppercase = string[0] == string[0].upcase
  last_character_is_punctuation = %w[. ! ?].include? string[-1]
  if first_letter_is_uppercase && last_character_is_punctuation
    return true
  else
    return false
  end
end
