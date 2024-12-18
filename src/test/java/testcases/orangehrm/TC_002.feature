Feature: Login with valid credentials https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Background:
    * startConfig("chrome")
    * def loginpage = locator('orangehrm', 'loginpage')
    * def basepage = locator('orangehrm', 'basepage')
    * def addemployeepage = locator('orangehrm', 'addemployeepage')
    * def userData = data('orangehrm', 'users')
    * def appData = data('orangehrm', 'appData')


  Scenario: Login with valid credentials
#   Step 0. Navigate Orange HRM page
    * driver appData.url
    * call orangehrm.login { loginUsername: "#(userData.validUser.username)", loginPassword: "#(userData.validUser.password)" }

#   Step 1. Click on the "PIM" tab
    * click(format(basepage.leftMenuItem, 'PIM'))
    # VP: PIM menu is displayed
    * waitFor(format(basepage.pageTitle, 'PIM'))
    * match exists(format(basepage.pageTitle, 'PIM')) == true

#   Step  2. Click on "Add Employee"
    * def filePath = appData.imgPhotoFilePath
    * click(format(basepage.topMenuItem, 'Add Employee'))
#    VP: Add Employee form is displayed
    * waitFor(addemployeepage.formTitle)
    * match exists(addemployeepage.formTitle) == true

#   Step  3. Enter a valid First Name (e.g., John)
    * input(addemployeepage.firstName, "John")
#    VP: First Name field is populated
    * match value(addemployeepage.firstName) == 'John'

#   Step 4. Enter a valid Last Name (e.g., Doe)
    * input(addemployeepage.lastName, "Doe")
#   VP: Last Name field is populated
    * match value(addemployeepage.lastName) == 'Doe'

#    Step 5. Select the "Browse" button for the "Profile Picture" field
#    Step 6. Select a valid image file (e.g., .jpg, .png)
#    Step 7. Click "Open"

    * click(addemployeepage.employeeImage)
    * robot { window: 'Open', highlight: true, highlightDuration: 500 }
    * robot.waitFor('//edit{File name:}').input(filePath)
    * robot.locateAll('//button{Open}')[2].click()
    * delay(3000)
    * waitForEnabled(addemployeepage.employeeImage)
    * def imgSource = attribute(addemployeepage.employeeImage, 'src')
    * match imgSource contains "data:image/"

#    8. Click "Save" button
    * click(addemployeepage.saveButton)
    * waitFor(addemployeepage.savedEmployeeMessage)
    * match text(addemployeepage.savedEmployeeMessage) == 'Employee has been saved'


