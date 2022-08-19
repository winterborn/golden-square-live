class Dish
  def initialize(name, price, type, quantity)
    @name = name
    @price = price
    @type = type
    @quantity = quantity
  end

  def name
    @name
  end

  def price
    @price
  end

  def type
    @type
  end

  def quantity
    @quantity
  end

  def format
    "#{@type.capitalize}: #{name} - £#{price}"
  end
end
