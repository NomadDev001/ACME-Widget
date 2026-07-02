class Basket
  def initialize(catalogue, delivery_rules, offers = [])
    @catalogue = catalogue
    @delivery_rules = delivery_rules
    @offers = offers
    @items = []
  end

  def add(product_code)
    raise ArgumentError, "Unknown product code: #{product_code}" unless @catalogue.key?(product_code)

    @items << product_code
  end

  def total
    amount = subtotal - discount
    (amount + delivery_for(amount)).floor(2)
  end

  private

  def subtotal
    @items.sum { |product_code| @catalogue[product_code][:price] }
  end

  def discount
    @offers.sum { |offer| offer.discount(@items, @catalogue) }
  end

  def delivery_for(amount)
    @delivery_rules.charge_for(amount)
  end
end