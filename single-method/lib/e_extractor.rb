def e_extractor(string)
  if string.include? "e"
    # letters = string.chars
    # e_idx = letters.index("e")
    # before_e = string[0, e_idx]
    # after_e = string[e_idx + 1, string.length]
    # return "e#{before_e}#{after_e}"

    letters = string.chars
    e_letters = letters.select { |l| l == "e" }.join
    non_e_letters = letters.select { |l| l != "e" }.join
    return "#{e_letters}#{non_e_letters}"
  else
    return string
  end
end
