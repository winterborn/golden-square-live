# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes.

# re-do & simplify!!!!

class Order
  def initialize(menu)
    @menu = menu
  end

  def basket
    @basket
  end

  def dish_order(dish)
    @menu
    # puts "What would you like from the menu?"
  end

  def select_dishes(dish)
    name_test = @menu.list_of_dishes.select { |dish| dish.name }
    # name_test.map { |dish| dish.name }
  end

  # put selected items into a basket
  # add chosen items to basket
end
