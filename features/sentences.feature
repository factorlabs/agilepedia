Feature: Hello Cucumber
As a product manager
I want our users to be greeted when they visit our site
So that they have a better experience

Scenario: User sees form to add new Sentence
  When I visit "sentences/new"
  Then I should see "New Sentence"
  
Scenario: User can add new Sentence
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And Sentence with title "New Sentence title" and with body "New Sentence body" should be created
  
Scenario: User can update existing Sentence
  Given Sentence with title "Existing Sentence title" exists
  When I visit "sentences/existing-sentence-title/edit"
  And I fill in "sentence[title]" field with "New existing Sentence title"
  And I fill in "sentence[body]" field with "New existing Sentence body"
  And I press "commit" button
  Then I should see "Sentence was successfully updated."
  And Sentence with title "New existing Sentence title" and with body "New existing Sentence body" should be created
  
Scenario: New User is added during adding the Sentence
  Given there is no User with email "john.doe@example.com"
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "user[first_name]" field with "John"
  And I fill in "user[second_name]" field with "Doe"
  And I fill in "user[organisation]" field with "ACME"
  And I fill in "user[email]" field with "john.doe@example.com"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And User with first name "John" and with second name "Doe" and with organisation "ACME" and with email "john.doe@example.com" should be created
  And Sentence with title "New Sentence" should be asigned to User with email "john.doe@example.com"
  
Scenario: New User is added during adding the Sentence
  Given there is no User with email "john.doe@example.com"
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "user[first_name]" field with "John"
  And I fill in "user[second_name]" field with "Doe"
  And I fill in "user[organisation]" field with "ACME"
  And I fill in "user[email]" field with "john.doe@example.com"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And User with first name "John" and with second name "Doe" and with organisation "ACME" and with email "john.doe@example.com" should be created
  And Sentence with title "New Sentence" should be asigned to User with email "john.doe@example.com"
  
Scenario: New User is not added during adding the Sentence if already exists
  Given there is User with email "john.doe@example.com"
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "user[first_name]" field with "John"
  And I fill in "user[second_name]" field with "Doe"
  And I fill in "user[organisation]" field with "ACME"
  And I fill in "user[email]" field with "john.doe@example.com"
  And I press "commit" button
  Then I should see "Sentence was successfully created."
  And there is one User with first name "John" and with second name "Doe" and with organisation "ACME" and with email "john.doe@example.com" should be created
  And Sentence with title "New Sentence" should be asigned to User with email "john.doe@example.com"