Feature: Login UI - Swag Labs

  Background:
    * def users = read('classpath:ui/data/users.json')
    * def locators = read('classpath:ui/locators/login.json')
    * def uiHelpers = call read('classpath:ui/utilities/ui-helpers.js')
    * def loginPage = call read('classpath:ui/pages/login.js')
    * def homePage = call read('classpath:ui/pages/home.js')

  Scenario: Successful login on Swag Labs
    * call loginPage.open
    * call loginPage.login { username: #(users.valid.username), password: #(users.valid.password) }
    * call homePage.assertWelcome
