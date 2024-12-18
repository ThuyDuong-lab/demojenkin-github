Feature: Login with valid credentials https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Background:
    * startConfig("chrome")
    * def viewjobvacancypage = locator('orangehrm', 'viewjobvacancypage')
    * def addjobvacancypage = locator('orangehrm', 'addjobvacancypage')
    * def basepage = locator('orangehrm', 'basepage')
    * def userData = data('orangehrm', 'users')
    * def appData = data('orangehrm', 'appData')


  Scenario: Login with valid credentials
    # Step 0. Navigate Orange HRM page
    * driver appData.url
    * call orangehrm.login { loginUsername: "#(userData.validUser.username)", loginPassword: "#(userData.validUser.password)" }
    * waitFor(format(basepage.pageTitleText, 'Dashboard'))

#    Step 1. Navigate to the Leave module
    * click(format(basepage.leftMenuItemText, 'Leave'))
#    VP: Recruitment module page is displayed
    * waitFor(format(basepage.pageTitleText, 'Leave'))
    * match exists(format(basepage.pageTitleText, 'Leave')) == true

#    Step 2. Click "Apply Leave"
    * click(format(basepage.topMenuItemText, 'Apply'))

#    Step 3. Select the leave type

    * delay(500000)
    * print "AAAA"
    * mouse().move(applyleavepage.leaveTypeComboBox).click()
    * mouse().move(applyleavepage.leaveTypeItemText).click()

    * delay(500000)







