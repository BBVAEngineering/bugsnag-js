Feature: Reporting handled errors

Scenario: calling notify() with Error
  When I navigate to the URL "/handled/a.html"
  And I let the test page run for up to 10 seconds
  And I wait for 5 seconds
  Then I should receive 1 request
  And the exception "errorClass" equals "Error"
  And the exception "message" equals "bad things"

Scenario: calling notify() with { name, message }

Scenario: calling notify() with { errorClass, errorMessage }
