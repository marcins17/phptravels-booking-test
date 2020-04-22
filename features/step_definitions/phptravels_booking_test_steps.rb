require 'cucumber'
require 'watir-webdriver'

Given(/^a user goes to phptravels/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto "https://www.phptravels.net/home"
end

When(/^the user clicks on "([^"]*)" element$/) do |arg|
  @browser.button(visible_text: "#{arg}").click
end

Then(/^flight results should be loaded$/) do
  @browser.wait_until_present(timeout=10)
  @browser.close
end