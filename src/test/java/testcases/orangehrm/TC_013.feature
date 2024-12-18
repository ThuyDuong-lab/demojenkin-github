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

#    Step 1. Navigate to the Recruitment module
    * click(format(basepage.leftMenuItemText, 'Recruitment'))
#    VP: Recruitment module page is displayed
    * waitFor(format(basepage.pageTitleText, 'Recruitment'))
    * match exists(format(basepage.pageTitleText, 'Recruitment')) == true

#    Step 2. Click "Add Job Vacancy"
    * click(format(basepage.topMenuItemText, 'Vacancies'))
    * click(viewjobvacancypage.addButton)

#    3. Fill in the required fields (job title, description, etc.)
    * input(addjobvacancypage.vacancyNameTextbox, 'Hoa')
    * input(addjobvacancypage.hiringManagerTextbox, 'Ranga  Akunuri')
    * delay(10000)
    * print "AAAA"
    * mouse().move(addjobvacancypage.jobTitleComboBox).click()

    * delay(10000)
    * scroll("//div[@role='listbox']")
    * def isExists =  exists(format(addjobvacancypage.jobTitleText, 'Automaton Tester'))
    * print isExists

#    * call orangehrm.swipeToJobTitle {jobTitleName:'Automaton Tester' }
#    * def IsItemExist = exists(format(viewjobvacancy.jobTitleText, 'Automaton Tester'))
#    * swipeScreen(direction="down")






