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

Then(/^I see "([^"]*)" with price "([^"]*)" and an "([^"]*)" button$/) do |arg1, arg2, arg3|
  pending # Write code here that turns the phrase above into concrete actions
end
