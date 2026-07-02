require_relative "../lib/basket"

RSpec.describe Basket do
  it "can be initialized with catalogue, delivery rules, and offers" do
    catalogue = {}
    delivery_rules = double("DeliveryRules")
    offers = []

    basket = Basket.new(catalogue, delivery_rules, offers)

    expect(basket).to be_a(Basket)
  end

  it "adds a product to the basket" do
    catalogue = {
      "B01" => { name: "Blue Widget", price: 7.95 }
    }

    basket = Basket.new(catalogue, double("DeliveryRules"), [])

    basket.add("B01")

    expect(basket.instance_variable_get(:@items)).to eq(["B01"])
  end

  it "raises an error for an unknown product code" do
    catalogue = {
      "B01" => { name: "Blue Widget", price: 7.95 }
    }

    basket = Basket.new(catalogue, double("DeliveryRules"), [])

    expect { basket.add("X01") }.to raise_error(ArgumentError, "Unknown product code: X01")
  end

  it "calculates the subtotal of items" do
    catalogue = {
      "B01" => { name: "Blue Widget", price: 7.95 },
      "G01" => { name: "Green Widget", price: 24.95 }
    }

    basket = Basket.new(catalogue, double("DeliveryRules"), [])

    basket.add("B01")

    basket.add("G01")

    expect(basket.subtotal).to eq(32.90)
  end  

  it "calculates the total for one blue widget" do
    catalogue = {
      "B01" => { name: "Blue Widget", price: 7.95 }
    }
  
    basket = Basket.new(catalogue, DeliveryRules.new, [])
  
    basket.add("B01")
  
    expect(basket.total).to eq(12.90)
  end
end