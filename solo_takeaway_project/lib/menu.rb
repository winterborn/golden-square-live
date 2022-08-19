class Menu
  def initialize
    @menu = []
  end

  def add_dish(dish)
    @menu << dish
  end

  def list_of_dishes
    return @menu
  end

  def formatted_menu
    # return(
    #   "Starters:\n #{@menu[0].name} - £#{@menu[0].price},\n #{@menu[1].name} - £#{@menu[1].price},\n Main:\n #{@menu[2].name} - £#{@menu[2].price},\n #{@menu[3].name} - £#{@menu[3].price},\n Dessert:\n #{@menu[4].name} - £#{@menu[4].price},\n #{@menu[5].name} - £#{@menu[5].price}"
    # )
    starter_select = @menu.select { |dish| dish.type["starter"] }
    starters = starter_select.map { |dish| "#{dish.name} - £#{dish.price}" }
    main_select = @menu.select { |dish| dish.type["main"] }
    main = main_select.map { |dish| "#{dish.name} - £#{dish.price}" }
    dessert_select = @menu.select { |dish| dish.type["dessert"] }
    dessert = dessert_select.map { |dish| "#{dish.name} - £#{dish.price}" }

    return(
      "Starters:\n\n #{starters.join(",\n ")},\n\n Main:\n\n #{main.join(",\n ")},\n\n Dessert:\n\n #{dessert.join(",\n ")}"
    )
  end
end
