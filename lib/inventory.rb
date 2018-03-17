require 'singleton'

# Class that defines the Product Inventory
class Inventory
  include Singleton

  attr_accessor :products

  def initialize

    voucher = Product.new('VOUCHER', 'Cabify Voucher', 5.0)
    tshirt = Product.new('TSHIRT', 'Cabify T-Shirt', 20.0)
    mug = Product.new('MUG', 'Cafify Coffee Mug', 7.5)
    @products = [voucher, tshirt, mug].map{ |product| [product.code.to_sym, product] }.to_h

  end

  def find(code)
    @products[code.to_sym]
  end

end
