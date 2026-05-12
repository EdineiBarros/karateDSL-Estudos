Feature: GET

  Background:
    * url baseUrl

  @done
  Scenario: Validar dados response

    Given path 'usuarios', '0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200

    And match response.nome == 'Fulano da Silva'
    And match response.email == 'fulano@qa.com'
    And match response.password == 'teste'
    And match response.administrador == 'true'
    And match response._id == '0uxuPY0cbmQhpEz1'

  @done
  Scenario: Validar dados no Json
    Given url 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200

    * def expected = read('classpath:data/getUserResponse.json')

    And match response contains expected


  @done
  Scenario: Validar tipos de dados no Json
    Given url 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200

    * def schema = read('classpath:schema/getUserResponseSchema.json')

    And match response == schema