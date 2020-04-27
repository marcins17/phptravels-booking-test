require "cucumber"
require "watir"

Given(/^I am on the PHPTRAVELS booking site/) do
  @browser.goto "https://www.phptravels.net/home"
end

When(/^I select "([^"]*)" section$/) do |arg|
  @browser.link(href: /#{arg}/).click
end

And(/^I provide "([^"]*)" as a starting point$/) do |arg|
  result_label = @browser.div(:class => "select2-result-label")
  @browser.div(:id => "s2id_location_from").click
  if @browser.text_field(:class => "select2-input").exists?
    @browser.text_field(:class => /select2-focused/).set("#{arg}")
    if result_label.exists?
      result_label.click
    else
      @browser.div(:id => "select2-drop-mask").click
    end
  end
end

And(/^I provide "([^"]*)" as a destination point$/) do |arg|
  #result_li = @browser.li(:class => /result-selectable/)
  @browser.div(:id => "s2id_location_to").click
  if @browser.text_field(:class => "select2-input").exists?
    @browser.text_field(:class => /select2-focused/).set("#{arg}")
    # if result_li.exists?
    #   @browser.text_field(:class => /select2-focused/).click
    # else
    #   @browser.div(:id => "select2-drop-mask").click
    # end
  end
  sleep(3)
  @browser.div(:class => "select2-result-label").click
end

Then(/^flight results should be displayed$/) do
  sleep(2)

end

# def provide_travel_point(location_div, city)
#   @browser.div(:id => "#{location_div}").click
#   if @browser.text_field(:class => "select2-input").exists?
#     @browser.text_field(:class => /select2-focused/).set("#{city}")
#     sleep(3)
#     @browser.div(:class => "select2-result-label").click
#   end
# end