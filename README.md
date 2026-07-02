# Acme Widget Basket

A Ruby implementation of the Acme Widget Co shopping basket.

## Features

- Add products by product code
- Validate product codes
- Apply promotional offers
- Calculate delivery charges
- Return the final basket total
- RSpec test coverage

## Project Structure

```
lib/
  basket.rb
  delivery_rules.rb
  red_widget_offer.rb

spec/
  basket_spec.rb
  delivery_rules_spec.rb
  red_widget_offer_spec.rb
```

## Setup

Install dependencies:

```bash
bundle install
```

Run the tests:

```bash
bundle exec rspec
```

## Design Decisions

### Basket

Responsible for managing items and coordinating checkout.

### DeliveryRules

Encapsulates delivery pricing so shipping rules can change independently.

### RedWidgetOffer

Encapsulates the promotion logic for Red Widgets. Additional offers can be added without modifying the Basket class.

## Assumptions

- Delivery is calculated after discounts.
- Unknown product codes raise an `ArgumentError`.
- Promotions are passed into the basket as dependencies.
- Currency totals are rounded down to match the provided examples.