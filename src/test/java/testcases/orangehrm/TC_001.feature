Feature: Login with valid credentials https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Background:
    * startConfig("chrome")
    * def loginpage = locator('orangehrm', 'loginpage')
    * def basepage = locator('orangehrm', 'basepage')
    * def userData = data('orangehrm', 'users')
    * def appData = data('orangehrm', 'appData')


  Scenario: Login with valid credentials
    # Step 0. Navigate Orange HRM page
    * driver appData.url

#    Step 1. Enter a valid username (e.g., Admin)
#    Step 2. Enter a valid password (e.g., admin123)
#    Step 3. Click on the "Login" button
    * call orangehrm.login { loginUsername: "#(userData.validUser.username)", loginPassword: "#(userData.validUser.password)" }
    * waitForUrl('/dashboard/index')
    * waitFor(format(basepage.pageTitleText, 'Dashboard'))
    * match exists(format(basepage.pageTitleText, 'Dashboard')) == true
