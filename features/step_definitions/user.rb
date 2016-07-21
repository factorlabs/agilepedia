Given(/^there is no User with email "([^"]*)"$/) do |email|
  User.destroy_all(email: email)
end

Then(/^User with first name "([^"]*)" and with last name "([^"]*)" and with organisation "([^"]*)" and with email "([^"]*)" should be created$/) do |first_name, last_name, organisation, email|
  expect(User.where(first_name: first_name, last_name: last_name, organisation: organisation, email: email).count).to be_truthy
end

Given(/^there is User with email "([^"]*)"$/) do |email|
  User.find_or_create_by(email: email)
end

Then(/^there is one User with email "([^"]*)"$/) do |email|
  expect(User.where(email: email).count).to eq(1)
end