Then(/^Sentence with title "([^"]*)" and with body "([^"]*)" should be created$/) do |title, body|
  expect(Sentence.where(title: title, body: body).count).to be_truthy
end

Given(/^Sentence with title "([^"]*)" exists$/) do |title|
  Sentence.find_or_create_by(title: title)
end

Then(/^Sentence with title "([^"]*)" should be asigned to User with email "([^"]*)"$/) do |title, email|
  expect(Sentence.where(title: title).author.email).to eq(email)
end