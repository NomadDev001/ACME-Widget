require_relative "../lib/red_widget_offer"

RSpec.describe RedWidgetOffer do
  let(:catalogue) do
    {
      "R01" => { name: "Red Widget", price: 32.95 }
    }
  end

  it "gives no discount for one red widget" do
    offer = RedWidgetOffer.new

    discount = offer.discount(["R01"], catalogue)

    expect(discount).to eq(0)
  end
end