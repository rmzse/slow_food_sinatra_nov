When(/^I visit the dishes page$/) do
  visit '/'
end

Given(/^I have a dish called "([^"]*)" with price "([^"]*)"$/) do |name, price|
  dish = Dish.new
  dish.name = name
  dish.price = price
  dish.save
end

Then(/^I should see the page$/) do
  save_and_open_page
end

Then(/^I see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I see "([^"]*)" button$/) do |button|
 expect(page).to have_button button
end
