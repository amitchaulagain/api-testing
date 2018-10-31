Feature: Test contact's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Create  Contacts
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('contact_create.graphql')
    And def input_contact = read('contact_create.json')

    And print input_contact
    And request { query: '#(query)',variables:'#(input_contact)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

    * def created_id = response.data.addContact.id




#     here the query is read from a file
#     note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    And def query = read('contact_byId.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.contact._id==variables._id


    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('contact_update.graphql')
    And def input_contact = read('contact_update.json')
    And def variables = { _id: '#(created_id)' }
        And request { query: '#(query)',variables:'#(variables)' }
        And header Authorization = rew3Token

        And header Accept = 'application/json'
        When method post
        Then status 200
        And assert response.data.contact._id==variables._id

  #clone contacts

   Given def query = read('contact_clone.graphql')
      And def input_contact = read('contact_clone.json')
      And print input_contact
      And request { query: '#(query)',variables:'#(input_contact)' }
      And header Authorization = rew3Token
      * print rew3Token
      And header Accept = 'application/json'
      When method post
      Then status 200

      * def created_id = response.data.addContact.id


    And def query = read('contact_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

  Scenario: Attach And Detach Contacts
  #For attach and detach contacts
  * print created_id


  Scenario: Get All Contact
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('contacts.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    * print rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200


  Scenario: Filtering and Sorting Contacts


  #Filtering with starts with

          Given def query = read('filter.graphql')
              And def input_filter = read('startsWith_filter.json')
              And request { query: '#(query)',variables:'#(input_filter)' }
              And header Authorization = rew3Token
              * print rew3Token
              And header Accept = 'application/json'
              When method post
              Then status 200
              Then print $

   ##filtering with date range

  Given def query = read('filter.graphql')
                And def input_filter = read('range_filter.json')
                And request { query: '#(query)',variables:'#(input_filter)' }
                And header Authorization = rew3Token
                * print rew3Token
                And header Accept = 'application/json'
                When method post
                Then status 200
                Then print response

  ##filtering with date range

    Given def query = read('filter.graphql')
      And def input_filter = read('is_filter.json')
      And request { query: '#(query)',variables:'#(input_filter)' }
      And header Authorization = rew3Token
      * print rew3Token
      And header Accept = 'application/json'
      When method post
      Then status 200
      Then print response


    #sorting and filtering

    Given def query = read('filter.graphql')
        And def input_filter = read('contact_filter.json')
        And request { query: '#(query)',variables:'#(input_filter)' }
        And header Authorization = rew3Token
        * print rew3Token
        And header Accept = 'application/json'
        When method post
        Then status 200
        Then print response
        ##---ToDo validation












