Feature: Invitation
  Scenario: sending an invitation
    Given a user is signed in as admin
    And has a calendar
    When he enters valid email address
    And selects calendars
    Then an invitation is generated and stored with unguessable id
    When email address is of a registered user
    Then send an email inviting him to join the calendar (with links to add and decline)
    When email address is new to site
    Then send email to join the site or use a calendar without joining
    And create new user with given email (skipping all but email format validations)

  Scenario: new users response to an invitation
    Given a person has received an invitation
    And clicks on its link
    Then a person should see registration form and a continue without registration link

  Scenario: existing users response to an invitation
  	Given a person received invitation
  	And clicks "Join the calendars" link
  	Then he should see the list of a calendars he is invited to
  	And click "Accept" on the ones he would like to join
  	And click "Decline" on the ones he would like to decline

  Scenario: invited user successfully signs up
    Given a user has a valid invitation
    And a user fills in the form
    And clicks sign up
    When data is valid
    Then user should see successful signup message
    And be redirected to existing users response to invitation

  Scenario: invited user proceeds without registration
    Given that user has a valid invitation
    And he clicks "Proceed without sign up"
    Then all the calendars associated with his email address should be automatically accepted
    And he should see message urging to sign up with a link
    And see the list of calendars associated with his email address
    And his permissions should be set to very low

  Scenario: registered user clicks on add calendar to account button
    Given user is signed in
    And clicks add button
    Then calendars should be added to his account (AJAX)
    When he clicks "View All Calendars"
    Then he should be redirected to his calendars list
    And newly added calendars should be highlighted

  Scenario: unsuccessful signup
    Given a user has filled in signup form
    And clicks Submit button
    When it doesnt pass validations
    Then user should see error messages
    And there should be still possibility to continue without registering





Invitation: invitation id, save email
Invitation has email, calendar
Calendar belongs to user