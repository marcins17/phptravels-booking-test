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

def insert_departure_date(departure_date_input, next_month_button)
  if departure_date_input.exists?
    click_on_element(departure_date_input)
  else
    click_on_element(next_month_button)
    departure_date_input.wait_until_present
    click_on_element(departure_date_input)
  end
end

def click_on_element(element)
  element.fire_event("mousedown")
  element.fire_event("click")
end
