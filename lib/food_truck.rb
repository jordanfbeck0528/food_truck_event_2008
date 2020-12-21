class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    @inventory.sum do |item_obj, quantity|
      item_obj.price * quantity
    end
  end
end
