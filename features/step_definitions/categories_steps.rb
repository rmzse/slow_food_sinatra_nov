Given(/^I have a dish called "([^"]*)" with price "([^"]*)" and category "([^"]*)"$/) do |name, price, category|
  dish = Dish.new
  dish.name = name
  dish.price = price
  dish.category = category
  dish.save
end

When(/^I visit the index page$/) do
  visit '/'
end

Then(/^I see "([^"]*)" with price "([^"]*)" and an "([^"]*)" button$/) do |name, price, button|
  expect(page).to have_content name
  expect(page).to have_content price
  expect(page).to have_button button
end
