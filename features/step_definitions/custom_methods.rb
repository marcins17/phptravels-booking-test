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

def get_date_and_return_departure_date(current_date, days_to_departure)
  departure_date = (current_date + days_to_departure).to_s
  departure_date_splitted = departure_date.split("-")
  departure_year = departure_date_splitted[0]
  departure_month_decremented = ((remove_leading_zero(departure_date_splitted[1]).to_i) - 1).to_s
  departure_day = remove_leading_zero(departure_date_splitted[2])
  return [departure_year, departure_month_decremented, departure_day]
end

def remove_leading_zero(number_str)
  number_no_leading_zero = number_str.sub(/^[0]*/,"")
  return number_no_leading_zero
end

