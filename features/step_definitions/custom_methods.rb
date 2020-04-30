require 'watir'
require 'date'

def set_travel_point(city)
  input_field_active = @browser.text_field(:class => /select2-focused/)
  input_result_label = @browser.div(:class => "select2-result-label")
  input_drop_mask = @browser.div(:id => "select2-drop-mask")
  input_field_active.set("#{city}")
  sleep(3)   # let the result suggestion appear after typing
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
  if departure_date_input.exists?
    click_on_element_fire_event(departure_date_input)
  else
    click_on_element_fire_event(next_month_button)
    departure_date_input.wait_until_present
    click_on_element_fire_event(departure_date_input)
  end
end

def click_on_element_fire_event(element)
  element.fire_event("mousedown")
  element.fire_event("click")
end
