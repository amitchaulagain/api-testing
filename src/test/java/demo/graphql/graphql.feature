Feature: test graphql end pointss

Background:
* url 'http://45.55.45.137:9999/graphql'
# this live url should work if you want to try this on your own
# * url 'https://graphql-pokemon.now.sh'

Scenario: simple graphql request
    # note the use of text instead of def since this is NOT json    
    Given text query =
    """
        query test {
            transactions{
                data {
                    _id
                    name
                }
                limit
                offset
                total_count
            }
        }
    """
    And request { query: '#(query)' }
    And header Authorization = 'Bearer ODg2NWNjMDktOWE3YS00MWZlLWE4ZDItMmFhY2FkMTJmZDQ3'
    And header Accept = 'application/json'
    When method post
    Then status 200

    # pretty print the response
    * print 'response:', response

    # json-path makes it easy to focus only on the parts you are interested in
    # which is especially useful for graph-ql as responses tend to be heavily nested
    # '$' happens to be a JsonPath-friendly short-cut for the 'response' variable


