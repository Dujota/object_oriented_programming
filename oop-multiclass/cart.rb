require_relative 'product'

class Cart

    @@cart = []

    def self.items
      return @@cart
    end

  def self.add(name, base_price)
    @@cart << Product.new(name, base_price)
    return @@cart
  end

  def self.remove(item)
    @@cart.each do |product|
      if @name == item
        @@cart.delete(item)
      end
    end
  end

  def self.all_before_tax
    sum = 0
    @@cart.each { |item| sum =+ item.base_price }
    return  sum
  end

  def self.all_after_tax
    sum = 0
    @@cart.each{ |item| sum =+ item.total_price}
  end

  def most_expensive
    @@cart.max { |item| puts "#{item}"  }
  end

end

orange = Cart.add("orange", 3.00)
melon = Cart.add("melon", 5.00)
carrot = Cart.add("carrot", 2.00)
human = Cart.add("human", 100.00)
puts orange.inspect
puts Cart.items.inspect
puts Cart.all_before_tax.inspect
puts Cart.all_after_tax.inspect
Cart.remove("orange")
puts '-'*33
puts Cart.items.inspect
