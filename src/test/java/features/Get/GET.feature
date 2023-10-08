Feature: GET API Request

  Background:
    * url 'https://reqres.in/api'
    * header accept = 'application/json'

# simple GET request
  Scenario: GET API Test
    Given path 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseHeaders
    And print responseCookies


# GET request with Background
  Scenario: GET API Test with Background
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response


# GET request with path, Params
  Scenario: GET API Test with path, params
    Given path '/users'
    And params page = 2
    When method GET
    Then status 200
    And print response


# GET request with assertions
  Scenario: GET API Test with assertions
    Given path '/users'
    And params page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 4
    And match response.data[4].last_name == "Morris"