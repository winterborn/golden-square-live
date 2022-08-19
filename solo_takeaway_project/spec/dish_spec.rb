require "dish"

RSpec.describe Dish do
  it "constructs" do
    dish = Dish.new("Jerusalem Artichoke Soup", "11", "starter", "")
    expect(dish.name).to eq "Jerusalem Artichoke Soup"
    expect(dish.price).to eq "11"
    expect(dish.type).to eq "starter"
    expect(dish.quantity).to eq ""
  end

  it "returns formatted dish" do
    dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter", "")
    expect(dish_1.format).to eq "Starter: Jerusalem Artichoke Soup - £11"
  end

  it "returns formatted dishes" do
    dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter", "")
    dish_2 = Dish.new("Roasted Onion Squash", "10", "starter", "")
    dish_3 = Dish.new("Cornish Plaice", "11", "main", "")
    dish_4 = Dish.new("Cumbrian Neck Of Lamb", "12", "main", "")
    dish_5 = Dish.new("Lemon Cheesecake", "7", "dessert", "")
    dish_6 = Dish.new("Assorted Sorbet", "8", "dessert", "")
    expect(dish_1.format).to eq "Starter: Jerusalem Artichoke Soup - £11"
    expect(dish_2.format).to eq "Starter: Roasted Onion Squash - £10"
    expect(dish_3.format).to eq "Main: Cornish Plaice - £11"
    expect(dish_4.format).to eq "Main: Cumbrian Neck Of Lamb - £12"
    expect(dish_5.format).to eq "Dessert: Lemon Cheesecake - £7"
    expect(dish_6.format).to eq "Dessert: Assorted Sorbet - £8"
  end
end
