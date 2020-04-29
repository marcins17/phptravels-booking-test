require 'watir'
require 'date'

def set_travel_point(city)
  input_field = @browser.text_field(:class => "select2-input")
  input_field_active = @browser.text_field(:class => /select2-focused/)
  input_result_label = @browser.div(:class => "select2-result-label")
  input_drop_mask = @browser.div(:id => "select2-drop-mask")
  if input_field.wait_while_present.exists?
    input_field_active.set("#{city}")
  end
  sleep(2)
  if input_result_label.exists?
    input_result_label.click
  else
    input_drop_mask.click
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

def insert_departure_date(departure_date_input, next_month_button)
  unless departure_date_input.exists?
    next_month_button.fire_event("mousedown")
    next_month_button.fire_event("click")
    departure_date_input.wait_until_present
    departure_date_input.fire_event("mousedown")
    departure_date_input.fire_event("click")
  else
    departure_date_input.fire_event("mousedown")
    departure_date_input.fire_event("click")
  end
end
