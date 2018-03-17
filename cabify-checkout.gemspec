Gem::Specification.new do |s|
  s.name               = "cabify-checkout"
  s.version            = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thiago Bonfante"]
  s.date = %q{2018-03-17}
  s.description = %q{Ruby Challenge}
  s.email = %q{thiagobonfante@gmail.com}
  s.files = ["Rakefile", "lib/checkout/checkout.rb", "lib/checkout/discount_bulk_purchase.rb", "lib/checkout/discount_free_offer.rb", "lib/checkout/discount.rb", "lib/checkout/invetory.rb", "lib/checkout/product.rb" ]
  s.test_files = ["test/checkout_test.rb"]
  s.homepage = %q{https://github.com/thiagobonfante/cabify-checkout}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Ruby Challenge}

  if s.respond_to? :specification_version then
    s.specification_version = 3
    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
