Feature: Test account's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#

  Scenario: Actions and Relations (Create, Update, Clone, Delete, Attach, Detach)
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


    #clone account

       Given def query = read('account_clone.graphql')
       And def variables = { _id: '#(created_id)' }
          And def input_account = read('account_clone.json')
          And print input_account
          And request { query: '#(query)',variables:'#(input_account)' }
          And header Authorization = rew3Token
          * print rew3Token
          And header Accept = 'application/json'
          When method post
          Then status 200

          * def clone_id = response.data.cloneAccount.id

          ##delete cloned Account

        And def query = read('account_delete.graphql')
            And def variables = { _id: '#(clone_id)' }
            * print variables
            And request { query: '#(query)',variables:'#(variables)' }
            And header Authorization = rew3Token
            * print rew3Token
            And header Accept = 'application/json'
            When method post
            Then status 200


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


    ##Attach Detach

    Given def query = read('attach.graphql')

            And def input_account = read('attachDetach.json')
            And print input_account
            * print variables
            And request { query: '#(query)',variables:'#(input_account)' }
            And header Authorization = rew3Token
            And header Accept = 'application/json'
            When method post
            Then status 200
            Then print response


        Given def query = read('detach.graphql')

         And def input_account = read('attachDetach.json')
         And print input_account
         * print variables
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





  Scenario: Views (Get All, Get All with Selected Fields)
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('accounts.graphql')
    And request { query: '#(query)' }
    And header Authorization = rew3Token
    And header Accept = 'application/json'
    When method post
    Then status 200

  Scenario: Filters (Filter by Conditions and Sort Ascending, Descending)


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
           And def input_filter = read('account_filter.json')
           And request { query: '#(query)',variables:'#(input_filter)' }
           And header Authorization = rew3Token
           * print rew3Token
           And header Accept = 'application/json'
           When method post
           Then status 200
           Then print response
           ##---ToDo validation
















