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

#    Step 1. 2. Click "Add Performance Review"
    * click(format(basepage.leftMenuItemText, 'Performance'))
#    VP: Recruitment module page is displayed
    * waitFor(format(basepage.pageTitleText, 'Performance'))
    * match exists(format(basepage.pageTitleText, 'Performance')) == true

#    Step 2. Click "Add Performance Review"
    * click("//span[text()='Manage Reviews ']")
    * waitFor("//a[text()='Manage Reviews']").click()
    * click("//button[text()=' Add ']")
    * input("//div[*[text()='Employee Name']]/following-sibling::div//input", "Ranga")
    * mouse().move("//div[@role='listbox']/div[*[text()='Ranga  Akunuri']]").click()
    * input("//div[*[text()='Review Period Start Date']]/following-sibling::div//input", '2024-17-12')
    * input("//div[*[text()='Review Period End Date']]/following-sibling::div//input", '2024-27-12')
    * input("//div[*[text()='Due Date']]/following-sibling::div//input", '2024-28-12')
    * delay(500000)

#





