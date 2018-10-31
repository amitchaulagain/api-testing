Feature: Test Case's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Create  Case
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('case_create.graphql')
    And def input_case = read('case_create.json')
    And print input_case
    And request { query: '#(query)',variables:'#(input_case)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

    * def created_id = response.data.addCase.id




#     here the query is read from a file
#     note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    And def query = read('case_byId.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.case._id==variables._id

    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('case_update.graphql')
    And def input_case = read('case_update.json')
    And print input_case
    And request { query: '#(query)',variables:'#(input_case)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response


      # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('case_attach.graphql')
    And def input_case = read('case_attach.json')
    And print input_case
    And request { query: '#(query)',"operationName":"MainList",variables:'#(input_case)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response




      # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('case_detach.graphql')
    And def input_case = read('case_attach.json')
    And print input_case
    And request { query: '#(query)',"operationName":"MainList",variables:'#(input_case)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response



    And def query = read('case_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.deleteCase.id==variables._id




  Scenario: Get All Cases
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('case.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
















