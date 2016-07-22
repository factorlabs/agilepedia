Feature: Sentence managment
  As a Service Owner
  I want to obliged Users to confirm added sentences by clicking on the link send via email
  So that I protect service from spam and collect Users information
  
Scenario: User can add new Sentence
  Given there is no Sentence with title "New Sentence title"
  When I visit "sentences/new"
  And I fill in "sentence[title]" field with "New Sentence title"
  And I fill in "sentence[body]" field with "New Sentence body"
  And I fill in "sentence[user_attributes][first_name]" field with "John"
  And I fill in "sentence[user_attributes][last_name]" field with "Doe"
  And I fill in "sentence[user_attributes][organisation]" field with "ACME"
  And I fill in "sentence[user_attributes][email]" field with "john.doe@example.com"
  And I press "commit" button
  Then Sentence with title "New Sentence title" should have confirmation token generated