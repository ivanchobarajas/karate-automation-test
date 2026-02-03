Feature: Login UI skeleton

  Background:
    * configure driver = { type: 'chromium', headless: #(headless) }
    * def locators = read('classpath:ui/locators/login.json')
    * def users = read('classpath:ui/data/users.json')

  Scenario: Load example landing page
    Given driver baseUrl
    Then waitFor(locators.mainHeading)
    And match text(locators.mainHeading) == 'Example Domain'
    And match users.admin.username == 'admin@example.com'
