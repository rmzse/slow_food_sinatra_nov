Feature: As a Visitor
  In order to place an order.
  I need to be able to add dishes to an order.

  Background:
    Given I have a dish called "Garlic Bread" with price "3.99" and category "Starter"
    And I have a dish called "Salad" with price "4.99" and category "Main Course"
    And I have a dish called "Meatballs" with price "8.99" and category "Main Course"
    And I have a dish called "Brule" with price "5.99" and category "Dessert"
    
  Scenario: Visitor adds first dish to order
    When I visit the site
    And I click "Add to Order" for "Meatballs"
    Then I should see "added to order"

  Scenario: Visitor adds first dish to order
    When I visit the site
    And I have a dish in my order
    And I click "Add to Order" for "Salad"
    Then I should see "added to order"
    And I should have "2" dishes on my order
