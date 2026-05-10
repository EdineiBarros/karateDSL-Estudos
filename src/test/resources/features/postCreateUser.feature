Feature: Criar usuário

  Background:
    * url baseUrl

  @done
  Scenario: Criar usuário com sucesso

    Given path 'usuarios'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    * def randomEmail = 'user_' + java.lang.System.currentTimeMillis() + '@qa.com.br'
    * def payload =
"""
    {
      "nome": "Fulano da Silva",
      "email": "#(randomEmail)",
      "password": "teste",
      "administrador": "true"
    }
    """

    And request payload
    When method POST
    Then status 201

  @done
  Scenario: Criar usuário com sucesso validar response

    Given url 'https://serverest.dev/usuarios'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    * def randomEmail = 'user_' + java.lang.System.currentTimeMillis() + '@qa.com.br'
    * def payload =
"""
    {
      "nome": "Fulano da Silva",
      "email": "#(randomEmail)",
      "password": "teste",
      "administrador": "true"
    }
    """

    And request payload
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#regex ^[a-zA-Z0-9]{16}$'


  @done
  Scenario: Criar usuário com sucesso validar schema response

    Given url 'https://serverest.dev/usuarios'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    * def randomEmail = 'user_' + java.lang.System.currentTimeMillis() + '@qa.com.br'
    * def payload =
"""
    {
      "nome": "Fulano da Silva",
      "email": "#(randomEmail)",
      "password": "teste",
      "administrador": "true"
    }
    """

    And request payload
    When method POST
    Then status 201
    * def schema = read('classpath:schema/postUserResponseSchema.json')

    And match response == schema


