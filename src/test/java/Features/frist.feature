Feature: Simple Api Test
  Scenario: Test a simple Get API

    Given url is https://reqres.in/api/users?page=2
    When method GET
    Then status 200
