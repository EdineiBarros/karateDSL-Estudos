Feature: Login com dados no gherkin

  Background:
    * url baseUrl

  @done
  Scenario Outline: validar login com múltiplos usuários
    Given path 'login'
    And request
    """
    {
      "email": "<email>",
      "password": "<senha>"
    }
    """
    When method post
    Then status <status>

    Examples:
      | email                 | senha  | status |
      | fulano@qa.com         | teste  | 200    |
      |                       | teste  | 400    |
      | user_321051@qa.com.br |        | 400    |
      |                       |        | 400    |
      | user_0845@qa.com.br   | teste  | 401    |
      | user_321051@qa.com.br | errado | 401    |
      | user_0845@qa.com.br   | errado | 401    |

  @rodar
  Scenario Outline: validar login com dados nos arquivos Json

    Given path 'login'

    # lê o json do request
    And request read(<arquivoRequest>)

    When method post

    Then status <status>

    # valida response
    And match response == read(<arquivoResponse>)

    Examples:
      | status | arquivoRequest                                                  | arquivoResponse                                                        |
      | 200    | 'classpath:schema/request/postLoginSucessoRequest.json'         | 'classpath:schema/response/postLoginSucessoResponse.json'              |
      | 401    | 'classpath:schema/request/postLoginUsuarioInvalidoRequest.json' | 'classpath:schema/response/postLoginUsuarioSenhaInvalidoResponse.json' |
      | 401    | 'classpath:schema/request/postLoginSenhaInvalidaRequest.json'   | 'classpath:schema/response/postLoginUsuarioSenhaInvalidoResponse.json' |
      | 400    | 'classpath:schema/request/postLoginSemUsuarioRequest.json'      | 'classpath:schema/response/postLoginSemUsuarioResponse.json'           |
      | 400    | 'classpath:schema/request/postLoginSemSenhaRequest.json'        | 'classpath:schema/response/postLoginSemSenhaResponse.json'             |