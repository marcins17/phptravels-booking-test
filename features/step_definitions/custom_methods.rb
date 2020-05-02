# custom methods to less code usage for repeated operations

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

def click_on_element(element)
  element.fire_event("mousedown")
  element.fire_event("click")
end

def parse_data
  results = @browser.lis(:class => %w(all item))
  $price_elements = []
  $duration_elements = []
  $starting_point_elements = []
  $destination_point_elements = []
  results.each do |li|
    price = li.input(:id => "price").value.to_i
    duration = li.div(:class => /-fly-time/).text
    starting_point = li.div(:class => /-line-start/).div(:class => /-line-title/).text
    destination_point = li.div(:class => /-line-end/).div(:class => /-line-title/).text
    $price_elements.push(price)
    $duration_elements.push(duration)
    $starting_point_elements.push(starting_point)
    $destination_point_elements.push(destination_point)
  end
end
