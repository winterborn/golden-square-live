require "menu"
require "dish"
require "order"

RSpec.describe "Integration" do
  describe Menu do
    it "constructs" do
      menu = Menu.new
      dish_1 = Dish.new("", "", "", "")
      menu.add_dish(dish_1)
      expect(menu.list_of_dishes).to eq [dish_1]
    end

    it "adds menu items to menu list, returns menu list" do
      menu = Menu.new
      dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter", "")
      dish_2 = Dish.new("Roasted Onion Squash", "10", "starter", "")
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      expect(menu.list_of_dishes).to eq [dish_1, dish_2]
    end

    it "returns formatted menu list" do
      menu = Menu.new
      dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter", "")
      dish_2 = Dish.new("Roasted Onion Squash", "10", "starter", "")
      dish_3 = Dish.new("Cornish Plaice", "11", "main", "")
      dish_4 = Dish.new("Cumbrian Neck Of Lamb", "12", "main", "")
      dish_5 = Dish.new("Lemon Cheesecake", "7", "dessert", "")
      dish_6 = Dish.new("Assorted Sorbet", "8", "dessert", "")
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      menu.add_dish(dish_4)
      menu.add_dish(dish_5)
      menu.add_dish(dish_6)
      expect(
        menu.formatted_menu
      ).to eq "Starters:\n\n Jerusalem Artichoke Soup - £11,\n Roasted Onion Squash - £10,\n\n Main:\n\n Cornish Plaice - £11,\n Cumbrian Neck Of Lamb - £12,\n\n Dessert:\n\n Lemon Cheesecake - £7,\n Assorted Sorbet - £8"
    end
  end

  describe Order do
    it "shows menu items for order" do
      menu = Menu.new
      dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter", "")
      dish_2 = Dish.new("Roasted Onion Squash", "10", "starter", "")
      dish_3 = Dish.new("Cornish Plaice", "11", "main", "")
      dish_4 = Dish.new("Cumbrian Neck Of Lamb", "12", "main", "")
      dish_5 = Dish.new("Lemon Cheesecake", "7", "dessert", "")
      dish_6 = Dish.new("Assorted Sorbet", "8", "dessert", "")
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      menu.add_dish(dish_4)
      menu.add_dish(dish_5)
      menu.add_dish(dish_6)
      order = Order.new(menu)
      expect(order.dish_order(dish_1)).to eq [
           "Cornish Plaice - £11, Lemon Cheesecake - £7"
         ]
    end
  end
end
