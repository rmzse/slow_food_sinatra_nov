Given(/^I have a dish called "([^"]*)" with price "([^"]*)"$/) do |name, price|
  dish = Dish.new
  dish.name = name
  dish.price = price
  dish.save
end

Then(/^I should see "([^"]*)" button$/) do |button|
  expect(page).to have_button button
end
