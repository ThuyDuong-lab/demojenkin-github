@ignore
Feature: Scroll to select job title
  Background:
    * def controls = locator('orangehrm', 'addjobvacancypage')

  Scenario: Scroll to select job title
    * print "Scroll to select job title"
    * def IsItemExist = exists(format(locator.jobTitleText, jobTitleName))
#    * swipeScreen(direction="down")
    * def selectJobTitle =
        """
        function(){
        var timeout = 10
        while (IsItemExist == false && timeout >0){
          scroll(format(locator.jobTitleText, jobTitleName))
          timeout = timeout - 1;
          IsItemExist = exists(format(locator.jobTitleText, jobTitleName))
          }
        }
        """
    * def result = waitUntil(selectJobTitle)
    * click(format(locator.jobTitleText, jobTitleName))



