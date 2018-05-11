@handled
Feature: Reporting handled errors

Scenario Outline: calling notify() with Error
  When I navigate to the URL "/handled/<type>/a.html"
  And I let the test page run for up to 10 seconds
  And I wait for 5 seconds
  Then I should receive 1 request
  And the request is a valid browser payload for the error reporting API
  And the exception "errorClass" equals "Error"
  And the exception "message" equals "bad things"

  Examples:
    | type       |
    | script     |
    | webpack3   |
    | webpack4   |
    | browserify |

Scenario Outline: calling notify() with Error within try/catch
  When I navigate to the URL "/handled/<type>/b.html"
  And I let the test page run for up to 10 seconds
  And I wait for 5 seconds
  Then I should receive 1 request
  And the request is a valid browser payload for the error reporting API
  And the exception matches the "handled" values for the current browser

  Examples:
    | type       |
    | script     |
    | webpack3   |
    | webpack4   |
    | browserify |

Scenario Outline: calling notify() with Error within Promise catch
  Given the browser supports "Promise"
  When I navigate to the URL "/handled/<type>/c.html"
  And I let the test page run for up to 10 seconds
  And I wait for 5 seconds
  Then I should receive 1 request
  And the request is a valid browser payload for the error reporting API
  And the exception "errorClass" equals "Error"
  And the exception "message" equals "bad things"

  Examples:
    | type       |
    | script     |
    | webpack3   |
    | webpack4   |
    | browserify |
