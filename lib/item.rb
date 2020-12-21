class Item
  attr_reader :name
  def initialize(item_data)
    @name = item_data[:name]
    @price = item_data[:price]
  end

  def price
    @price.delete("$").to_f
  end
end
