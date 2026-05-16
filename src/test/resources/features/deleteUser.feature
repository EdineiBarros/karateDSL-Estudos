Feature: DELETE

  Background:
    * url baseUrl
    * def user = call read('classpath:features/postCreateUser.feature@massa')
    * def userId = user.userId

  @done
  Scenario: Deletar usuário com sucesso

    Given path 'usuarios', userId
    And header accept = 'application/json'
    When method DELETE
    Then status 200

    Given path 'usuarios', userId
    When method GET

    Then status 400
    And match response.message == 'Usuário não encontrado'
