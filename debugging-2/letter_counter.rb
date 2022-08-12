class LetterCounter
  def initialize(text)
    @text = text
    # text is taken in LetterCounter class and made available globally.
  end

  def calculate_most_common()
    counter = Hash.new(0)
    # p counter
    most_common = nil
    # p most_common
    most_common_count = 1
    # p most_common_count

    @text.chars.each do |char|
      next unless is_letter?(char)
      counter[char] = (counter[char] || 1) + 1
      if counter[char] > most_common_count
        most_common = char
        most_common_count = counter[char]
      end
    end
    return most_common_count, most_common
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]

# problem solved - counter was firstly starting at 1 instead of zero - this skewed the output.
# also as the loop assigned a counter to each occurance of letter from string,
# most_common_count was being += counter[char] instead of just = counter[char]
