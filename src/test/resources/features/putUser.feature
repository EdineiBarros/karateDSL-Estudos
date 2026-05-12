Feature: PUT

   Background:
       * url baseUrl

@done
Scenario: Editar usuário com sucesso validar response

Given path 'usuarios', '0uxuPY0cbmQhpEz1'
And header accept = 'application/json'
And header Content-Type = 'application/json'

* def faker = Java.type('com.github.javafaker.Faker')
* def fake = new faker()
* def randomName = fake.name().fullName()
* def randomEmail = fake.internet().emailAddress()
* def payload =
"""
    {
      "nome": "#(randomName)",
      "email": "#(randomEmail)",
      "password": "teste",
      "administrador": "true"
    }
    """

And request payload
When method PUT
Then status 200
And match response.message == 'Registro alterado com sucesso'