require_relative 'discount'

class DiscountBulkPurchase < Discount
  attr_reader :quantity, :discount_value

  def initialize(code, quantity, discount_value)
    super(code)
    @quantity = quantity
    @discount_value = discount_value
  end

  # apply- Checks if the products must apply to bulk purchase rule
  def apply(products)
    products_match = products.select{ |p| p.code == @code }
    products_match.each { |product| product.price -= @discount_value } if products_match.size >= @quantity
  end

end
