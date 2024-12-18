@ignore
Feature: Login Page
  Background:
    * def controls = locator('orangehrm', 'loginpage')

  Scenario: Select top menu
    * print 'DEFAULT: login to Orange HRM'
    * input(controls.usernameTextbox, loginUsername)
    * input(controls.passwordTextbox, loginPassword)
    * click(controls.loginButton)