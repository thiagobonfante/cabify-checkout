class Checkout
  attr_reader :total, :cart

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @cart = []
  end

  # scan:bool - Scan if product exists in Inventory (Mock)
  def scan(code)
    product = Inventory.instance.find(code)
    if product.nil?
      false
    else
      @cart.push(product.clone)
      true
    end
  end

  # total:number - Calculate de Checkout total and apply the princing rules
  def total
    @pricing_rules.each{ |rule| rule.apply(@cart) }
    @cart.inject(0.0){ |total, product| total += product.price }
  end

end
