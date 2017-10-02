class Product

  TAX_RATE = 1.13 #(13%tax)

  attr_accessor :name, :base_price, :tax_rate

  def initialize(name, base_price)
    @name = name
    @base_price = base_price
  end

  def total_price
    base_price * TAX_RATE
  end

end
