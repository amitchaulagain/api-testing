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
    And header Authorization = 'Bearer ZDNkNWU2YjEtNTI5MC00MjAyLWEyM2EtYTQxMDVhYmIxNmE0'
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
    And header Authorization = 'Bearer ZDNkNWU2YjEtNTI5MC00MjAyLWEyM2EtYTQxMDVhYmIxNmE0'
    And header Accept = 'application/json'
    When method post
    Then status 200
    And assert response.data.contact._id==variables._id



    And def query = read('contact_delete.graphql')
    And def variables = { _id: '#(created_id)' }
    * print variables
    And request { query: '#(query)',variables:'#(variables)' }
    And header Authorization = 'Bearer OWYwODcxOTEtNjQ0Yy00YjdkLTlhOWItYTNmOTI5ZGExMGUz'
    And header Accept = 'application/json'
    When method post
    Then status 200



  Scenario: Get All Contact
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('contacts.graphql')
    And request { query: '#(query)' }
    And header Authorization = 'Bearer ZDNkNWU2YjEtNTI5MC00MjAyLWEyM2EtYTQxMDVhYmIxNmE0'
    And header Accept = 'application/json'
    When method post
    Then status 200




  Scenario: Update  Contact
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building


    Given def query = read('contact_update.graphql')
    And def input_transaction = read('contact_update.json')

    And print input_contact
    And request { query: '#(query)',variables:'#(input_contact)' }
    And header Authorization = 'Bearer ODg2NWNjMDktOWE3YS00MWZlLWE4ZDItMmFhY2FkMTJmZDQ3'
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then print response










