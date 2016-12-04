Feature: As a Visitor.
  In order to know when my order is ready for pick-up.
  After clicking buy now, I would like to see an order confirmation with estimated pick up time.

  Background:
  Given I have a dish in my order and I am on the checkout_screen

  Scenario: Visitor clicks Buy now! and is taken to a order confirmation page with pick-up time.
  When I click "Buy now!"
  Then I should be on the order confirmation page
  And I should see "Thank you for your order! Your food will be ready for pickup in 30 minutes!"
