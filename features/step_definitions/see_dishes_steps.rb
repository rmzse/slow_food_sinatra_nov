Then(/^I should see "([^"]*)" button$/) do |button|
  expect(page).to have_button button
end
