#
#Background:
#* url 'http:159.203.162.230:8080/financial/v1'
#
#Scenario: get all transactions
#
#Given path 'commission/transaction'
#When method get
#Then status 200





Feature: sample karate test script
  If you are using Eclipse, install the free Cucumber-Eclipse plugin from
  https://cucumber.io/cucumber-eclipse/
  Then you will see syntax-coloring for this file. But best of all,
  you will be able to right-click within this file and [Run As -> Cucumber Feature].
  If you see warnings like "does not have a matching glue code",
  go to the Eclipse preferences, find the 'Cucumber User Settings'
  and enter the following Root Package Name: com.intuit.karate
  Refer to the Cucumber-Eclipse wiki for more: http://bit.ly/2mDaXeV

  Background:
    * url 'http://159.203.162.230:8080/financial/v1'

  Scenario: get all users and then get the first user by id

    Given path 'commission/transaction'
    When method get
    Then status 200


    * def first = response.data[0]

    Given path 'commission/transaction', first._id
    When method get
    Then status 200



