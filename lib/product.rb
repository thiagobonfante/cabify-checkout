class Product
  attr_reader :code, :name, :price
  attr_accessor :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

end
