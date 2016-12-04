Given(/^I am on the index page$/) do
  visit '/'
end

Then(/^I should be on the index page$/) do
  expect(page).to have_current_path('/')
end

When(/^I visit the site$/) do
  visit '/'
end

Given(/^the following dishes exists$/) do |table|
  steps %q{
    Given I have a dish called "Meatballs" with price "8.99"
    And I have a dish called "Salad" with price "4.99"
  }
end

Given(/^that I don't see "([^"]*)"$/) do |message_addded|
  expect(page).not_to have_content message_addded
end

Then(/^I should be on the Checkout page$/) do
  expect(page).to have_current_path('/checkout')
end

Then(/^I shold see a dish price of "([^"]*)"$/) do |price|
  expect(page).to have_content price
end

Then(/^I should see a "([^"]*)" button$/) do |button|
  expect(page).to have_button button
end
