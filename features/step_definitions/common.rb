When(/^I visit homepage$/) do
  visit root_path
end

When(/^I visit "([^"]*)"$/) do |page|
  visit page
end

When(/^I fill in "([^"]*)" field with "([^"]*)"$/) do |field, value|
  fill_in field, :with => value
end

When(/^I press "([^"]*)" button$/) do |button|
  find(:xpath, "//input[contains(@name, '#{button}')]").click()
end

When(/^I select the "([^"]*)" as "([^"]*)"$/) do |field, value|
    select(value, :from => field)  
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end