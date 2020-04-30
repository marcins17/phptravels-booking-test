require_relative 'custom_methods.rb'
require 'date'

Given(/^I am on the booking site homepage/) do
  @browser.goto "https://www.phptravels.net/home"
    #@browser.goto "https://www.phptravels.net/thflights/search/NYC/MUC/oneway/economy/2020-05-14/2/2/0"
end

When(/^I select "([^"]*)" section$/) do |arg|
  @browser.element(:href => /#{arg}/).click
end

And(/^I provide "([^"]*)" as a starting point$/) do |arg|
  @browser.div(:id => "s2id_location_from").click
  set_travel_point("#{arg}")
end

And(/^I provide "([^"]*)" as a destination point$/) do |arg|
  @browser.div(:id => "s2id_location_to").click
  set_travel_point("#{arg}")
end

And(/^I select departure date in "([^"]*)" days$/) do |arg|
  current_date = Date.today
  days_to_departure = "#{arg}".to_i
  departure_date = (current_date + days_to_departure).to_s.split("-")
  departure_date_input = @browser.div(:class => %w(datepicker active)).div(
      :data_date => departure_date[2].sub(/^[0]*/,""),
      :data_month => (departure_date[1].sub(/^[0]*/,"").to_i - 1).to_s,
      :data_year => departure_date[0])
  next_month_button = @browser.div(:class => %w(datepicker active)).div(:data_action => "next")
  calendar = @browser.input(:name => "departure_date")
  calendar.click
  insert_departure_date(departure_date_input, next_month_button)
end

And(/^I select "([^"]*)" adults$/) do |arg|
  #
  #add_button = @browser.div(:class => %w(col o2)).button(:class => %w(btn bootstrap-touchspin-up))
  #
  # I was trying with button implementation like above, but no action happened after click
  add_button = @browser.element(
      :xpath => "//*[@id='flights']/div/div/form/div/div[3]/div[3]/div/div/div[1]/div/div[2]/div/span/button[1]")
  adults = ("#{arg}".to_i - 1)
  adults.times do
    add_button.click
  end
end

And(/^I select "([^"]*)" children$/) do |arg|
  #
  #add_button = @browser.div(:class => %w(col o1)).button(:class => %w(btn bootstrap-touchspin-up))
  #
  # I was trying with button implementation like above, but no action happened after click
  #
  add_button = @browser.element(
      :xpath => "//*[@id='flights']/div/div/form/div/div[3]/div[3]/div/div/div[2]/div/div[2]/div/span/button[1]")
  children = "#{arg}".to_i
  children.times do
    add_button.click
  end
end

And(/^I submit data by clicking search button$/) do
  search_button = @browser.button(:type => "submit", :class => "btn-primary btn btn-block")
  click_on_element(search_button)
end

Then(/^flight results should be displayed by price ascending$/) do
  sleep(4)

end
