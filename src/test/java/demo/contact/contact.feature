Feature: Test contact's feature

  Background:
    * url 'http://45.55.45.137:9999/graphql'
#  # this live url should work if you want to try this on your own
## * url 'https://graphql-pokemon.now.sh'
#
#  Scenario: simple graphql request
#    # note the use of text instead of def since this is NOT json
#
#    Given text query =
#    """
#   {
#  "all($param: RequestParamInput) {transactions(param: $param){data{_id,name},limit,offset,total_count}}"
#}
#    """
#
#    And request { query: '#(query)' }
#    When method post
#    Then status 200
#
#


  Scenario: Get All Contacs
    # here the query is read from a file
    # note that the 'replace' keyword (not used here) can also be very useful for dynamic query building
    Given def query = read('contact.graphql')
    And request { query: '#(query)' }
    And header Authorization = 'Bearer ZDljMDlmMTQtZmQ0Yy00NTc2LWFhYmEtZThjZWIzOGUyYTQ0'
    And header Accept = 'application/json'
    When method post
    Then status 200









