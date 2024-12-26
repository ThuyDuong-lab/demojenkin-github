Feature: Login with valid credentials https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Background:
    * def loginpage = locator('orangehrm', 'loginpage')
    * def basepage = locator('orangehrm', 'basepage')
    * def addemployeepage = locator('orangehrm', 'addemployeepage')
    * def userData = data('orangehrm', 'users')
    * def appData = data('orangehrm', 'appData')


  Scenario: Login with valid credentials
#   Step 0. Navigate Orange HRM page
    * call read('TC_001.feature')

#   Step 1. Click on the "PIM" tab
    * waitFor(format(basepage.leftMenuItemText,'PIM')).click()
#   Step  2. Click on "Add Employee"
    * retry(5, 3000).waitFor(format(basepage.topMenuItemText,'Employee List')).click()
##    VP: Add Employee form is displayed
    * mouse().move("//div[*[text()='Employment Status']]/following-sibling::div//div[contains(@class,'text-input')]").click()
    *  delay(3000)
    * waitFor("//div[@role='listbox']")
    * scroll("//div[@role='listbox']//span[text()='Part-Time Contract']")
    * mouse().move("//div[@role='listbox']//span[text()='Part-Time Internship']").click()
    *  delay(1000)


