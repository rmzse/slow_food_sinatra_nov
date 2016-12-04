Feature: As a Visitor
  In order to see my chosen dishes and total price
  I need to checkout

  Background:
    Given I have a dish called "Garlic Bread" with price "3.99" and category "Starter"
    And I have a dish called "Salad" with price "4.99" and category "Main Course"
    And I have a dish called "Meatballs" with price "8.99" and category "Main Course"
    And I have a dish called "Brule" with price "5.99" and category "Dessert"

  Scenario: Visitor clicks check_out button with no added dishes
    Given I am on the index page
    And I click "Checkout"
    Then I should be on the index page
    Then I should see "Your order is empty"

  Scenario: Visitor clicks check_out button with added dishes
    When I am on the index page
    And I have a dish in my order
    And I click "Checkout"
    Then I should be on the Checkout page
    And I should see "Salad"
    And I shold see a dish price of "$4.99"
    And I should see "Total: $4.99"
    And I should see a "Buy now!" button
