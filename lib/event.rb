class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck_number)
    @food_trucks << truck_number
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(available_item)
    @food_trucks.select do |truck|
      if truck.inventory.keys.include?(available_item) &&
        truck.inventory[available_item] != 0
        truck
      end
    end
  end

  def total_inventory
    food_truck_data = Hash.new { |hash, key| hash[key] = {} }
    collected_items = @food_trucks.map do |truck|
      truck.inventory.keys
    end
    collected_items.flatten.uniq.each do |item|
      food_truck_data[item][:quantity] = quantity_for_each_item(item)
      food_truck_data[item][:food_trucks] = food_trucks_that_sell(item)
    end
    food_truck_data
  end

  def quantity_for_each_item(item)
    @food_trucks.sum do |truck|
      truck.inventory[item]
    end
  end

  def overstocked_items
    total_inventory.map do |item, item_data|
      item if item_data[:quantity] > 50 && item_data[:food_trucks].count >= 2
    end.compact
  end

  def sorted_item_list
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end
end
