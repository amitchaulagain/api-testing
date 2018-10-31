@ignore
Feature: oauth 2 test using
  http://brentertainment.com/oauth2

  Background:
    * url 'http://45.55.45.137:9999/security/v1'

  Scenario: oauth 2 flow

    * path 'login'
    And request {username: 'admin',password:'admin',client_secret: 'ZMwBETlfkvZTB1MbOx3DZwQ^UCN]MN',client_id:'MyOauth2Client',grant_type:'password'}


    When method post
    * status 200

#    * def accessToken = response.access_token
#
#
#    * header Authorization = 'Bearer ' + accessToken
#    * param access_token = accessToken
#    * method get
#    * status 200