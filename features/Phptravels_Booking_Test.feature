Feature: PHPTRAVELS flight booking feature
  As a user
  I should be able to search for and book a flight ticket
  from NYC to Munich for 2 adults and 2 children
  Flight date: two weeks from today

  Scenario: Flight results should be sorted by price from the lowest value
    Given I am on the PHPTRAVELS booking site
    When I select "flights" section
    And I provide "NYC" as a starting point
    And I provide "Munich" as a destination point
    #| from | to     | adults | children | date            |
    #| NYC  | Munich | 2      | 2        | two_weeks_later |
    Then flight results should be displayed
#    And should be sorted by price


