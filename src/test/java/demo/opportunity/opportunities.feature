Feature: Test Opportunities feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Actions and Relations (Create, Update, Clone, Delete, Attach, Detach)
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

    ##Clone Opportunity

    Given def query = read('opportunity_clone.graphql')
    And def variables = { _id: '#(created_id)' }
    And def input_opportunity = read('opportunity_clone.json')
    And print input_opportunity
    And request { query: '#(query)',variables:'#(input_opportunity)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    * def clone_id = response.data.cloneOpportunity.id


    ##Delete Cloned Opportunity

    And def query = read('opportunity_delete.graphql')
    And def variables = { _id: '#(clone_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200


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


    Given def query = read('attach.graphql')
    And def input_opportunity = read('attachDetach.json')
    And print input_opportunity
    And request { query: '#(query)',"operationName":"MainList",variables:'#(input_opportunity)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response




    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('detach.graphql')
    And def input_opportunity = read('attachDetach.json')
    And print input_opportunity
    And request { query: '#(query)',"operationName":"MainList",variables:'#(input_opportunity)' }
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


  Scenario: Views (Get All, Get All with Selected Fields)
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('opportunity.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

  Scenario: Filters (Filter by Conditions and Sort Ascending, Descending)

    Given def query = read('filter.graphql')
    And def input_filter = read('startsWith_filter.json')
    And request { variables:'#(input_filter)',query: '#(query)', }
    * print request
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    * print response

  ##filtering with date range

    Given def query = read('filter.graphql')
    And def input_filter = read('range_filter.json')
    And request { query: '#(query)',variables:'#(input_filter)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response


    Given def query = read('filter.graphql')
    And def input_filter = read('is_filter.json')
    And request { query: '#(query)',variables:'#(input_filter)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response


         #sorting and filtering

    Given def query = read('filter.graphql')
    And def input_filter = read('opportunity_filter.json')
    And request { variables:'#(input_filter)',query: '#(query)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response
     ##---ToDo validation














