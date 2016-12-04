Feature: As a visitor
  In order to choose dishes
  I need to be able to see a menu with dishes

  Background:
    Given I have a dish called "Meatballs" with price "8.99"
    And I have a dish called "Salad" with price "4.99"

  Scenario: Visitor see dishes
    When I am on the index page
    Then I should see "Main Courses"
    And I should see "Meatballs"
    And I should see "$8.99"
    And I should see "Salad"
    And I should see "$4.99"
    And I should see "Add to Order" button
    Then I should see "Checkout" button
