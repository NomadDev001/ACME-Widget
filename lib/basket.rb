class Basket
  def initialize(catalogue, delivery_rules, offers = [])
    @catalogue = catalogue
    @delivery_rules = delivery_rules
    @offers = offers
    @items = []
  end

  def add(product_code)
    unless @catalogue.key?(product_code)
      raise ArgumentError, "Unknown product code: #{product_code}"
    end

    @items << product_code
  end
end