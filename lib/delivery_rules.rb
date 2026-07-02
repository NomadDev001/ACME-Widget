class DeliveryRules
  def charge_for(subtotal)
    return 0.00 if subtotal >= 90
    return 2.95 if subtotal >= 50

    4.95
  end
end