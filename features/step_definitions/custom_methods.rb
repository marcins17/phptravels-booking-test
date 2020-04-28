require 'watir'
require 'date'

def set_travel_point(city)
  if @browser.text_field(:class => "select2-input").exists?
    @browser.text_field(:class => /select2-focused/).set("#{city}")
  end
  sleep(3)
  if @browser.div(:class => "select2-result-label").exists?
    @browser.div(:class => "select2-result-label").click
  else
    @browser.div(:id => "select2-drop-mask").click
  end
end

def format_departure_date
  current_date = Date.today
  puts "Inserting departure date"
  current_date_str = current_date.to_s
  two_weeks_later_str = (current_date + 14).to_s
  puts "Today date: " + current_date_str
  puts "Departure date: " + two_weeks_later_str
  date_splitted = two_weeks_later_str.split("-")
  year = date_splitted[0]
  month = date_splitted[1]
  day = date_splitted[2]
  month_formatted = month.sub(/^[0]*/,"")
  month_formatted_decremented_int = month_formatted.to_i - 1 #months are indexed starting from 0
  month_formatted_decremented = month_formatted_decremented_int.to_s
  day_formatted = day.sub(/^[0]*/,"")
  return [year, month_formatted_decremented, day_formatted]
end
