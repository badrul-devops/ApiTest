Feature: POST API REQUEST

  Background:
    * url 'https://reqres.in/api'
    * header accept = 'application/json'
    * def payload = read('PostResponse.json')

#simple POST Request
  Scenario: POST API Test
    Given url 'https://reqres.in/api/users'
    And request {"name": "Yelias Ahmed", "job": "SQA Engineer" }
    When method POST
    Then status 201
    And print response


#POST Request with Background
  Scenario: POST API Test with Background
    Given path '/users'
    And request {"name": "Yelias Ahmed", "job": "SQA Engineer" }
    When method POST
    Then status 201
    And print response


#POST Request with Assertions
  Scenario: POST API Test with Assertions
    Given path '/users'
    And request {"name": "Yelias Ahmed", "job": "SQA Engineer" }
    When method POST
    Then status 201
    And match response == {"name": "Yelias Ahmed","job": "SQA Engineer","id": "#string","createdAt": "#ignore" }
    And print response

#POST Request with PostResponse payload
  Scenario: POST API Test with PostResponse payload
    Given path '/users'
    And request {"name": "Yelias Ahmed", "job": "SQA Engineer" }
    When method POST
    Then status 201
    And match response == payload
    And print response

#POST Request with PostReq
  Scenario: POST API Test with PostReq json
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath +'src/test/java/jsonFiles/PostReq.json'
    And print filePath
    And def req = filePath
    And request req
    When method POST
    Then status 201
    And match response == payload
    And print response