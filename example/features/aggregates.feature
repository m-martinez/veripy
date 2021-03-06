Feature: Aggregate Sentences
    Aggregate sentences allow the Tester to run multiple sentences in one action
    or modify an existing sentence in new ways


    @example_app @aggregates @action @auth
    Scenario: Test that the user can send login credentials at the specified page
        Given that the browser is at "login"
        Then take a screen shot

        Given the user logged in via "login" with username "username" and password "password"
        Then the page title should be "Logged In"
        Then take a screen shot


    @example_app @aggregates @check @invert_check
    Scenario: Test that the Test Writer can check the inverse of a sentence
        Given that the browser is at "login"
        Then the page title should be "Log In"
        Then it is not the case that the page title should be "Logged In"
