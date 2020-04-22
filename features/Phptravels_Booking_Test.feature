Feature: Phptravels booking feature

  #Background: The user should be able to book a flight from NYC to Munich for two

  Scenario: Flight result should be sorted by price from the lowest value
    Given a user goes to phptravels
    When the user clicks on "flights" element
    Then flight results should be loaded


