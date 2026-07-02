class RedWidgetOffer
  PRODUCT_CODE = "R01".freeze

  def discount(items, catalogue)
    red_count = items.count(PRODUCT_CODE)
    pairs = red_count / 2
    red_price = catalogue[PRODUCT_CODE][:price]

    pairs * (red_price / 2.0)
  end
end