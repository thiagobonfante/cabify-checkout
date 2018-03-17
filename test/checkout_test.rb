require 'test/unit'
require_relative '../lib/checkout.rb'
require_relative '../lib/inventory.rb'
require_relative '../lib/product.rb'
require_relative '../lib/discount_bulk_purchase.rb'
require_relative '../lib/discount_free_offer.rb'

class CheckoutTest < Test::Unit::TestCase

  def setup
    
    # Instantiate rules
    @discount_bulk_purchase = DiscountBulkPurchase.new('TSHIRT', 3, 1.0)
    @discount_free_offer = DiscountFreeOffer.new('VOUCHER', 2)

    # Instantiate checkout
    @checkout = Checkout.new( [@discount_bulk_purchase, @discount_free_offer] )

  end

  def test_when_checkout_scan_for_products
    # Defined products
    assert_equal @checkout.scan("VOUCHER"), true
    assert_equal @checkout.scan("TSHIRT"), true
    assert_equal @checkout.scan("MUG"), true

    # Undefined products
    assert_equal @checkout.scan("FOO"), false
    assert_equal @checkout.scan("BAR"), false

  end

  def test_checkout_products_without_discount
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    @checkout.scan('MUG')
    assert_equal @checkout.total, 32.5
  end

  def test_checkout_products_with_discount_free_offer
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    assert_equal @checkout.total, 25.00
  end

  def test_checkout_products_with_discount_bulk_purchase
    @checkout.scan('TSHIRT')
    @checkout.scan('TSHIRT')
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    assert_equal @checkout.total, 81.0
  end

  def test_checkout_products_with_combined_discounts
    @checkout.scan('VOUCHER')
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    @checkout.scan('VOUCHER')
    @checkout.scan('MUG')
    @checkout.scan('TSHIRT')
    @checkout.scan('TSHIRT')
    assert_equal @checkout.total, 74.5
  end

  def test_checkout_with_undefined_products
    @checkout.scan('TSHIRT')
    @checkout.scan('VOUCHER')
    @checkout.scan('FOO')
    @checkout.scan('MUG')
    @checkout.scan('BAR')
    assert_equal @checkout.total, 32.5
  end

end
