Feature: Test account's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Create  Account
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('account_create.graphql')
    And def input_account = read('account_create.json')

    And print input_account
    And request { query: '#(query)',variables:'#(input_account)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

    * def created_id = response.data.addAccount.id




#     here the query is read from a file
#     note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    And def query = read('account_byId.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.account._id==variables._id


    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('account_update.graphql')
    And def input_account = read('account_update.json')

    And print input_account
    And request { query: '#(query)',variables:'#(input_account)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response


    And def query = read('account_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200



  Scenario: Get All Accounts
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('accounts.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
















