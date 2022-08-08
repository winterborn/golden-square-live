class Gratitudes
  def initialize
    @gratitudes = []
  end

  def add(gratitude)
    @gratitudes.push(gratitude)
  end

  def format
    formatted = "Be grateful for: "
    formatted += @gratitudes.join(", ")
  end
end

# gratitudes = Gratitudes.new
# gratitudes.add("thanks", "food")
# gratitudes.add("blue sky")
# puts gratitudes.format
