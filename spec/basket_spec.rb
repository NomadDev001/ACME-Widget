require_relative "../lib/basket"
require_relative "../lib/delivery_rules"
require_relative "../lib/red_widget_offer"

RSpec.describe Basket do
  let(:catalogue) do
    {
      "R01" => { name: "Red Widget", price: 32.95 },
      "G01" => { name: "Green Widget", price: 24.95 },
      "B01" => { name: "Blue Widget", price: 7.95 }
    }
  end

  let(:delivery_rules) { DeliveryRules.new }
  let(:offers) { [RedWidgetOffer.new] }

  def basket_with(*codes)
    basket = Basket.new(catalogue, delivery_rules, offers)
    codes.each { |code| basket.add(code) }
    basket
  end

  it "can be initialized with catalogue, delivery rules, and offers" do
    basket = Basket.new(catalogue, delivery_rules, offers)

    expect(basket).to be_a(Basket)
  end

  it "adds a product to the basket" do
    basket = basket_with("B01")

    expect(basket.instance_variable_get(:@items)).to eq(["B01"])
  end

  it "raises an error for an unknown product code" do
    basket = Basket.new(catalogue, delivery_rules, offers)

    expect { basket.add("X01") }.to raise_error(ArgumentError, "Unknown product code: X01")
  end

  it "calculates the total for one blue widget" do
    expect(basket_with("B01").total).to eq(12.90)
  end

  it "applies the red widget offer" do
    expect(basket_with("R01", "R01").total).to eq(54.37)
  end

  it "calculates B01, G01 as 37.85" do
    expect(basket_with("B01", "G01").total).to eq(37.85)
  end

  it "calculates R01, G01 as 60.85" do
    expect(basket_with("R01", "G01").total).to eq(60.85)
  end

  it "calculates B01, B01, R01, R01, R01 as 98.27" do
    expect(basket_with("B01", "B01", "R01", "R01", "R01").total).to eq(98.27)
  end
end