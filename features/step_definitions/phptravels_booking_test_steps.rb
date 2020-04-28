require 'cucumber'
require 'watir'
require_relative 'custom_methods.rb'

Given(/^I am on the PHPTRAVELS booking site/) do
  @browser.goto "https://www.phptravels.net/home"
end

When(/^I select "([^"]*)" section$/) do |arg|
  @browser.element(:href => /#{arg}/).click
end

And(/^I provide "([^"]*)" as a starting point$/) do |arg|
  @browser.div(:id => "s2id_location_from").click
  puts "Inserting #{arg} as a starting point"
  set_travel_point("#{arg}")
end

And(/^I provide "([^"]*)" as a destination point$/) do |arg|
  @browser.div(:id => "s2id_location_to").click
  puts "Inserting #{arg} as a destination point"
  set_travel_point("#{arg}")
end

And(/^I select depart date two weeks later than current date$/) do
  #depart_date_list = format_departure_date
  depart_date_list = [2020, 3, 29]
  puts depart_date_list

  @browser.input(:name => "departure_date").click
  sleep(5)
  depart_day_button = @browser.div(:data_date => depart_date_list[2].to_s,
                                    :data_month => depart_date_list[1].to_s,
                                    :data_year => depart_date_list[0].to_s)
  puts "depart_day_button"
  puts depart_day_button.exists?
  puts depart_day_button.visible?
  puts depart_day_button.present?

  sleep(5)
  next_month_nav_button = @browser.div(:data_action => "next", :class => "datepicker--nav-action")
  puts "next_month_nav_button"
  puts next_month_nav_button.exists?
  puts next_month_nav_button.visible?
  puts next_month_nav_button.present?



  # @browser.div(:data_date => depart_date_list[2].to_s,
  #              :data_month => depart_date_list[1].to_s,
  #              :data_year => depart_date_list[0].to_s).click

  #puts @browser.div(:data_action => "next", :class => "datepicker--nav-action").exists?
  #@browser.div(:data_action => "next", :class => "datepicker--nav-action").click

  # puts @browser.element(:tag_name => "svg").exists? #:class => "datepicker--nav-action",
  # @browser.button(:tag_name => "svg").click #:class => "datepicker--nav-action",
  # sleep(2)
  # puts @browser.div(:data_date => day_formatted,
  #                   :data_month => month_formatted_decremented.to_s,
  #                   :data_year => year).exists?
end

Then(/^flight results should be displayed$/) do
  sleep(2)

end
