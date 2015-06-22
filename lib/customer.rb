require_relative 'menu'
require_relative 'calculator'


class Customer
  attr_reader :menu

  def initialize
    @ordered = []
    @menu    = Menu.new
  end

  def check menu
    menu.items
  end

  def select_dishes(dish,num)
    @ordered << [dish,num]
  end

  def last_order
    get_order_number(@ordered.length-1)  
  end

  def order_report
    @ordered.map.with_index do |order, idx|
      get_order_number idx
    end
  end

  def get_order_number order_number
    dish_name = @ordered[order_number][0]
    dish_qty  = @ordered[order_number][1]
    dish_price = @menu.items[dish_name]

    { name: dish_name, quantity: dish_qty, price: dish_price}
  end



end