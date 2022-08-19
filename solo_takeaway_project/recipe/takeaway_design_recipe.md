Takeaway Multi-Class Planned Design Recipe

1. Describe the Problem
   Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.

   As a customer
   So that I can check if I want to order something
   I would like to see a list of dishes with prices.

   As a customer
   So that I can order the meal I want
   I would like to be able to select some number of several available dishes.

   As a customer
   So that I can verify that my order is correct
   I would like to see an itemised receipt with a grand total.

   Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

   As a customer
   So that I am reassured that my order will be delivered on time
   I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

   Fair warning: if you push your Twilio API Key to a public Github repository, anyone will be able to see and use it. What are the security implications of that? How will you keep that information out of your repository?

2. Design the Class System
   Design the interfaces of each of your classes and how they will work together to achieve the job of the program. You can use diagrams to visualise the relationships between classes.

```ruby
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices.

class Menu
  def initialize
    # ...
    # initialize menu []
  end

  def add_dish
    # adds dish name and dish price to initalized menu list
  end

  def list_of_dishes
    # list of dishes with prices
    # return list
  end

  def formatted_list
  end
end

class Dish
  def initialize(name, price, type, quantity)
    # ...
  end

  def name
  end

  def price
  end

  def type
  end

  def quantity
  end

  def format
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes.

class Order
  def select_dishes
    # dish name, dish price
    # quantity - select some number of several available dishes
    # e.g. dishes under £10
  end

  # put selected items into a basket
  # add chosen items to basket
end

# As a customer
# So that I can verify that my order is correct
# I would like to see an itemised receipt with a grand total.

class Bill
  def initialize
    # ...
  end

  def receipt
    # list of ordered items with prices
    # add prices to get total
  end

  def verify
    # is receipt == order?
  end
end
```

Steps 3, 4, and 5 then operate as a cycle.

3. Create Examples as Integration Tests
   Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

```ruby
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices.

# Menu
# 1 - constructs empty list
menu = Menu.new
dish_1 = Dish.new("", "", "", "")
menu.add_dish(dish_1)
expect(menu.list_of_dishes).to eq ["", "", "", ""]

# 2 - adds items to list, returns list
menu = Menu.new
dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter")
dish_2 = Dish.new("Roasted Onion Squash", "10", "starter")
menu.add_dish(dish_1)
menu.add_dish(dish_2)
expect(menu.list_of_dishes).to eq [
     "Jerusalem Artichoke Soup",
     "11",
     "starter",
     "Rosted Onion Squash",
     "10",
     "starter"
   ]

# 2 - adds items to list, returns formatted menu list
menu = Menu.new
dish_1 = Dish.new("Jerusalem Artichoke Soup", "11", "starter")
dish_2 = Dish.new("Roasted Onion Squash", "10", "starter")
dish_3 = Dish.new("Cornish Plaice", "11", "main")
dish_4 = Dish.new("Cumbrian Neck Of Lamb", "12", "main")
dish_5 = Dish.new("Lemon Cheesecake", "7", "dessert")
dish_6 = Dish.new("Assorted Sorbet", "8", "dessert")
menu.add_dish(dish_1)
menu.add_dish(dish_2)
menu.add_dish(dish_3)
menu.add_dish(dish_4)
menu.add_dish(dish_5)
menu.add_dish(dish_6)
expect(
  menu.format
).to eq "Starters: Jerusalem Artichoke Soup - £11, Roasted Onion Squash - £10, Main: Cornish Plaice - £11, Cumbrian Neck Of Lamb - £12, Dessert: Lemon Cheesecake - £7, Assorted Sorbet - £8"
```

Encode one of these as a test and move to step 4.

4. Create Examples as Unit Tests
   Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

Encode one of these as a test and move to step 5.

5. Implement the Behaviour
   For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.
