When(/^I visit the site$/) do
  visit '/'
end

When(/^I click "([^"]*)"$/) do |add_button|
  click_button add_button
end

Then(/^I should see "([^"]*)"$/) do |message_added|
  expect(page).to have_content message_added
end


When(/^I have a dish in my order$/) do
  steps %q{
    When I click "Add to Order" for "Salad"
    Then I should see "added to basket"
  }
end


Then(/^I should have "([^"]*)" dishes on my order$/) do |count|
  order = Order.last
  expect(order.order_items.count).to eq count.to_i
end


When(/^I click "([^"]*)" for "([^"]*)"$/) do |button, dish_name|
  dish = Dish.first(name: dish_name)
  within "#dish_form_#{dish.id}" do
    click_button button
  end
end
