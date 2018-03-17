require_relative 'discount'

class DiscountFreeOffer < Discount
  attr_reader :match_count

  def initialize(code, match_count)
    super(code)
    @match_count = match_count
  end

  # apply - Checks if the products list matches the intantiated discount method and turns one product free every match_count
  #   Example: 2-for-1 rule @match_count = 2 (if bought 6 products 2 of them must be free)
  def apply(products)
    products_match = products.select{ |i| i.code == @code }
    if products_match.size >= @match_count
      products_match.each_slice(@match_count) do |product, free|
        free.price = 0 unless free.nil?
      end
    end
  end

end
