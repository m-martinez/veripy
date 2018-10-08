Feature: Navigation Sentences
    Nagivation sentences allow a tester to move around the system

    @example_app @navigation @actions @browser_at_page
    Scenario: The Demo App can be navigated to
        Given that the browser is at "localhost-hello"
        Then take a screen shot

    @example_app @navigation @actions @browser_size
    Scenario: The Demo App browser can be resized
        Given that the browser is at "localhost-hello"
        Given the browser window is 600 by 400 pixels
        Then take a screen shot

    @example_app @navigation @actions @browser_switch_page
    Scenario: The Demo App page can be switched
        Given that the browser is at "localhost-hello"
        Given the browser is now at "other-page"
          """
          Context will change but the current page will not.
          Other Random Number is a property of other page, but not localhost-hello
          """
        Then the "Other Random Number" is not visible
        Then take a screen shot

    @example_app @navigation @actions @window_focus_last
    Scenario: The Demo App tab can be switched by clicking a link
        Given that the browser is at "localhost-hello"
        When the user clicks the "Other Tab Link"
        Then the browser should be at "localhost-hello"

        When the user switches to the last opened tab
        Then the browser should be at "other-page"
        And take a screen shot

    @example_app @navigation @actions @window_close_last
    Scenario: The Demo App tab can be switched by clicking a link and then reverted
        Given that the browser is at "localhost-hello"
        When the user clicks the "Other Tab Link"
        Then the browser should be at "localhost-hello"

        When the user switches to the last opened tab
        Then the browser should be at "other-page"

        When the user closes the last opened tab
        Then the browser should be at "localhost-hello"
        And take a screen shot

    @example_app @navigation @actions @click_element
    Scenario: The Demo App page can be switched by clicking a link

    Given that the browser is at "localhost-hello"
    Then write the "Random Number" generated by the system
    Then take a screen shot

    When the user clicks the "Other Page Link"
    Then the browser should be at "other-page"
    Then write the "Other Random Number" generated by the system
    Then take a screen shot

    @example_app @navigation @actions @click_element @exception
    Scenario: The Demo App page will raise the correct error when clicking on a missing element
    Given that the browser is at "localhost-hello"
    Then if 'the user clicks the "Missing Link"', the system responds with
      """
      The "Missing Link" was not found on the page.
      """
    Then take a screen shot

    @example_app @navigation @actions @click_element @xfail
    Scenario: XFail: The Demo App page will raise the correct error when clicking on a missing element
    Given that the browser is at "localhost-hello"
    When the user clicks the "Missing Link"
    Then take a screen shot

    @example_app @navigation @actions @click_nth_element
    Scenario: The Nth item sentence finds the correct item clicks it
        Given that the browser is at "localhost-hello"
        When the user clicks on the 2nd option in the "Checkboxes"
        Then take a screen shot

    @example_app @navigation @actions @click_nth_element @exception
    Scenario: The Nth item sentence will raise the correct error when clicking on a missing element
        Given that the browser is at "localhost-hello"
        Then if 'the user clicks on the 2nd option in the "Hidden Checkboxes"', the system responds with
             """
             The "Hidden Checkboxes" does not have a 2nd option that is clickable.
             """
        Then if 'the user clicks on the 99th option in the "Checkboxes"', the system responds with
            """
            The "Checkboxes" does not have a 99th option.
            """
        Then if 'the user clicks on the 2nd option in the "Missing Link"', the system responds with
            """
            The "Missing Link" was not found on the page.
            """
        Then take a screen shot

    @example_app @navigation @actions @press_keyboard_key
    Scenario: The tester can press keyboard keys
        Given that the browser is at "localhost-hello"
        When "Example Text" is entered into the "Required Field"
        When the user presses the "tab" key
        When "New Text" is entered into the current field
        Then the "Optional Field" has the value "New Text"
        Then take a screen shot


    @example_app @navigation @actions @wait_for_element @wait_time
    Scenario: The tester can wait for an element
        Given that the browser is at "localhost-hello"
        When the user waits 1 seconds for the "Required Field" to be visible
            """
            This does not check for visibility; it just waits either 1 second or
            untile the element is visible, whichever happens first
            """
        When the user waits 1 seconds
        Then take a screen shot


    @example_app @navigation @checks @browser_at_page
    Scenario: Test that the user can implicitly switch page contexts
        Given that the browser is at "localhost-hello"
        Then take a screen shot

        When the user clicks the "Other Page Link"
        Then the browser should be at "other-page"
        Then take a screen shot


    @example_app @navigation @checks @browser_at_page @exceptions
    Scenario: Test that the user can identify failed page context switches
        Given that the browser is at "localhost-hello"

        When the user clicks the "Other Page Link"
        Then the statement that 'the browser should be at "login"' responds with
            """
            Expected to be on the Page "login", but was not.
            """
        Then the browser should be at "other-page"
        Then take a screen shot

    @example_app @navigation @checks @browser_at_page @xfail
    Scenario: XFail: Test that the user can identify failed page context switches
        Given that the browser is at "localhost-hello"
        When the user clicks the "Other Page Link"
        Then the browser should be at "login"
        Then take a screen shot
