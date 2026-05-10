Feature: GET

  Background:
    * url baseUrl

  @done
  Scenario: Doing a GET
    Given path 'usuarios', '0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200