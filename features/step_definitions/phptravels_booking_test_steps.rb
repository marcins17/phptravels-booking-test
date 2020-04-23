require 'cucumber'
require 'watir'

Given(/^I am on the booking site/) do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
  @browser.goto 'https://www.phptravels.net/home'
end

When(/^I choose "([^"]*)" element$/) do |arg|
  flights_tab = @browser.iframe(text: '#{arg}').exist?
    #flights_tab.click
end

Then(/^flight results should be displayed$/) do
  sleep(10)
  @browser.close
end