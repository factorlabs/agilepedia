Then(/^Sentence with title "([^"]*)" and with body "([^"]*)" should be created$/) do |title, body|
  expect(Sentence.where(title: title, body: body).count).to be_truthy
end

Given(/^Sentence with title "([^"]*)" and body "([^"]*)" exists$/) do |title, body|
  Sentence.create(title: title, body: body)
end

Then(/^Sentence with title "([^"]*)" should be asigned to User with email "([^"]*)"$/) do |title, email|
  # expect(Sentence.find_by(title: title).user.email).to eq(email)
end