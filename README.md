# Solution to Cabify Mobile Challenge

This is my lib solution to [Ruby Challenge](https://github.com/cabify/rubyChallenge).

## Considerations

My solution is simple and consistent to the requisites that I found in the README of Challenge:

* Physical store which sells (only) 3 products
* Departments wants to apply discounts
* Discount rule: 2-for-1 promotions (buy two of the same product, get one free)
* Discount rule: bulk purchases (buying x or more of a product, the price of that product is reduced)
* Checkout interface has constructor with princing rules parameter and scan method
* This lib should be production-ready, have notes, easy to grow and mantain

In order to sustain the minimal requisites and the fact that I don't know the architectural reference where it's going to be acoupled there are things that were left behind:
* All the classes could be containerized using [dry-rb](https://github.com/dry-rb) to implement dependency injection and then it'll be more deacoupled and easy to find into Repositories
* Checkout could be more detailed with methods the describe more often functionalities of as it is
* Discount could be implemented using Behaviour Driven tool like [RSpec](http://rspec.info/) to turn those rules more flexible and dynamic

### Product

The Product class has three attributes:

* code
* name
* price

### Iventory

The Inventory class stores a hash of predefined products. It is a Singleton class because it won't change since the store has only 3 products and it has one method:

* ```find``` returns a Product from the Inventory.

### Discount (SuperClass)

The Discount class has the attribute ```code``` that is necessary for any discount rule.

### DiscountFreeOffer < Discount

The DiscountFreeOffer class constructor offers that is possible to point out the ```code``` of product that will be part of this rule, the purchase ```quantity``` that validate the rule and the ```discount_value``` to be deduced from the orginal Product price thru its only method: **apply**:

* ```apply``` receives a list of Products and checks it code to apply the discount.

### DiscountBulkPurchase < Discount

The DiscountBulkPurchase class constructor offers that is possible to point out the ```code``` of product who'll be part of this rule and ```matching_count``` that will be applied when it's going to be free thru its only method: **apply**:

* ```apply``` receives a list of Products and checks it code to apply the discount.

### Checkout

This Ckeckout class follows the example interface where the constructor receives the ```pricing_rules``` and has the following methods:

* ```scan``` receives the Product **code**
  - when the Product is found adds the Product to a public var **cart** and return **true**
  - when the Product is not found return **false**
* ```total``` applies the discount rules for each Product at **cart** then calculates the total amount and return it value

## Unit Tests

In addition I've built the class CheckoutTest that asserts the example shown on the Challenge README.
