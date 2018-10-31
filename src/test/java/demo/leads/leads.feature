Feature: Test lead's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Create  Lead
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('lead_create.graphql')
    And def input_lead = read('lead_create.json')

    And print input_lead
    And request { query: '#(query)',variables:'#(input_lead)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

    * def created_id = response.data.addLead.id




#     here the query is read from a file
#     note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    And def query = read('lead_byId.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.lead._id==variables._id



     # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('lead_update.graphql')

    And def input_lead = read('lead_update.json')
    And print input_lead
    * print variables
    And request { query: '#(query)',variables:'#(input_lead)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response



    And def query = read('lead_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.deleteLead.id==variables._id




  Scenario: Get All Lead
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('lead.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
















