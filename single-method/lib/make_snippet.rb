def make_snippet(str)
  if str.split.length > 5
    indiv_words = str.split
    after_5 = indiv_words[0, 5].join(" ")
    return "#{after_5}..."
  elsif str.split.length <= 5
    return str
  else
    return ""
  end
end

# p make_snippet("This is the best day of my life")
