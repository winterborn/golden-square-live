# before debugging
# def get_most_common_letter(text)
#   counter = Hash.new(0)
#   text.chars.each { |char| counter[char] += 1 }
#   counter.to_a.sort_by { |k, v| v }[0][0]
# end

# # Intended output:
# #
# # > get_most_common_letter("the roof, the roof, the roof is on fire!")
# # => "o"

# p get_most_common_letter("the roof, the roof, the roof is on fire!")

# during debugging
# def get_most_common_letter(text)
#   p "input text is: #{text}"
#   counter = Hash.new(0)
#   p "creates empty hash called: #{counter}"
#   text.chars.each { |char| counter[char] += 1 }
#   p "stores each character in counter hash where counter[0] is assigned to a number of times a letter appears: #{text.chars.each { |char| counter[char] += 1 }}"
#   counter.to_a.sort_by { |k, v| v }[0][0]
#   p counter.to_a.sort_by { |k, v| v }.reverse
#   p counter.to_a.sort_by { |k, v| v }.reverse[1][0]
# end

# p get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
#
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"

# #  after debugging
def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each { |char| counter[char] += 1 }
  counter.to_a.sort_by { |k, v| v }.reverse[1][0]
end

p get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
#
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
