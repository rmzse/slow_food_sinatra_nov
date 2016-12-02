Feature: As a visitor
  In order to choose dishes
  I need to be able to see a menu with dishes ordered in the categories: Starters, Main Courses and Desserts.

  Background:
    Given I have a dish called "Garlic Bread" with price "3.99" and category "Starters"
    And I have a dish called "Salad" with price "4.99" and category "Main Courses"
    And I have a dish called "Meatballs" with price "8.99" and category "Main Courses"
    And I have a dish called "Brule" with price "5.99" and category "Desserts"

  Scenario: Visitor sees dishes
    When I visit the index page
    Then I see "Starters"
    And I see "Garlic Bread" with price "$3.99" and an "Add to Order" button
    And I see "Main Courses"
    And I see "Meatballs" with price "$8.99" and an "Add to Order" button
    And I see "Salad" with price "$4.99" and an "Add to Order" button
    And I see "Desserts"
    And I see "Brule" with price "$5.99" and an "Add to Order" button
    Then I see "CHECKOUT" button
