Feature: Test Opportunities feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Create  Opportunity
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('opportunity_create.graphql')
    And def input_opportunity = read('opportunity_create.json')
    And print input_opportunity
    And request { query: '#(query)',variables:'#(input_opportunity)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

    * def created_id = response.data.addOpportunity.id




#     here the query is read from a file
#     note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    And def query = read('opportunity_byId.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.opportunity._id==variables._id


    Given def query = read('opportunity_update.graphql')
    And def variables = { _id: '#(created_id)' }
    And def input_opportunity = read('opportunity_update.json')
    And print input_opportunity
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response


    And def query = read('opportunity_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.deleteOpportunity.id==variables._id


  Scenario: Get All Opportunity
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('opportunity.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200














