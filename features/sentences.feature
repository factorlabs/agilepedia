Feature: Sentence managment
As a product manager
  As a User
  I want to have ability to manage Sentences
  So that I can learn and teach more about Agile

Scenario: User sees form to add new Sentence
  When I visit "sentences/new"
  Then I should see "New Sentence"
  
Scenario: User can add new Sentence
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "sentence[user_attributes][first_name]" field with "John"
  And I fill in "sentence[user_attributes][last_name]" field with "Doe"
  And I fill in "sentence[user_attributes][organisation]" field with "ACME"
  And I fill in "sentence[user_attributes][email]" field with "john.doe@example.com"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And Sentence with title "New Sentence title" and with body "New Sentence body" should be created
  
Scenario: New User is added during adding the Sentence
  Given there is no User with email "john.doe@example.com"
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "sentence[user_attributes][first_name]" field with "John"
  And I fill in "sentence[user_attributes][last_name]" field with "Doe"
  And I fill in "sentence[user_attributes][organisation]" field with "ACME"
  And I fill in "sentence[user_attributes][email]" field with "john.doe@example.com"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And User with first name "John" and with last name "Doe" and with organisation "ACME" and with email "john.doe@example.com" should be created
  And Sentence with title "New Sentence title" should be asigned to User with email "john.doe@example.com"
  
Scenario: New User is not added during adding the Sentence if already exists
  Given there is User with email "john.doe@example.com"
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "sentence[user_attributes][first_name]" field with "John"
  And I fill in "sentence[user_attributes][last_name]" field with "Doe"
  And I fill in "sentence[user_attributes][organisation]" field with "ACME"
  And I fill in "sentence[user_attributes][email]" field with "john.doe@example.com"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And there is one User with email "john.doe@example.com"
  And Sentence with title "New Sentence title" should be asigned to User with email "john.doe@example.com"