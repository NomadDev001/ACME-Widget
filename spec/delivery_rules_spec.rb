require_relative "../lib/delivery_rules"

RSpec.describe DeliveryRules do
  it "charges 4.95 when subtotal is under 50" do
    rules = DeliveryRules.new

    expect(rules.charge_for(32.90)).to eq(4.95)
  end
end