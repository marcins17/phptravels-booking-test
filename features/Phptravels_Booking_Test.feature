Feature: Phptravels flight booking feature
  As a user
  I should be able to search for and book a flight ticket
  from New York City to Munich for 2 adults and 2 children
  Flight date: two weeks from today

  Scenario: Flight result should be sorted by price from the lowest value
    Given I am on the booking site
    When I choose "flights" element
#    And I provide a following booking data
#    | from | to     | adults | children | date            |
#    | NYC  | Munich | 2      | 2        | two_weeks_later |
    Then flight results should be displayed
#    And should be sorted by price


