Feature: Test Listing's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Actions and Relations (Create, Update, Clone, Delete, Attach, Detach)
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('listing_create.graphql')
    And def input_listing = read('listing_create.json')

    And print input_listing
    And request { query: '#(query)',variables:'#(input_listing)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    * def created_id = response.data.addListing.id
    Then print response


#     here the query is read from a file
#     note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    And def query = read('listing_byId.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.listing._id==variables._id


    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('listing_update.graphql')
    And def input_listing = read('listing_update.json')

    And print input_listing
    And request { query: '#(query)',variables:'#(input_listing)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response





    And def query = read('listing_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200


  Scenario: Views (Get All, Get All with Selected Fields)

    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building

    Given def query = read('listings.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200




