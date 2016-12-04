Given(/^I have a dish in my order and I am on the checkout_screen$/) do
steps %q{
  Given the following dishes exists
    | name        | price  |
    | "Meatballs" | "8.99" |
    | "Salad"     | "4.99" |
    When I am on the index page
    And I have a dish in my order
    And I click "Checkout"
    Then I should be on the Checkout page
    And I should see "Salad"
    And I shold see a dish price of "$4.99"
    And I should see "Total: $4.99"
    And I should see a "Buy now!" button
  }
end


Then(/^I should be on the order confirmation page$/) do
  expect(page).to have_current_path '/order_confirmation'
end

Then(/^I should see a pick up time 30 minutes from now$/) do
  expect(page).to have_content (Time.now + 1800).strftime("%H:%M")
end
