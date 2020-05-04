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
  price_elements = []
  starting_point_elements = []
  destination_point_elements = []
  duration_elements = []
  results.each do |li|
    price_elements.push(li.input(:id => "price").value.to_i)
    starting_point_elements.push(li.div(:class => /-line-start/).div(:class => /-line-title/).text)
    destination_point_elements.push(li.div(:class => /-line-end/).div(:class => /-line-title/).text)
    duration_elements.push(li.div(:class => /-fly-time/).text.gsub(/[^0-9]/, ""))
  end
  return price_elements, starting_point_elements, destination_point_elements, duration_elements
end

def find_index_of_fastest_route
  data = parse_data
  duration = []
  data[3].each { |i|
    if i.length == 3
      duration.push(i.insert(2, "0").to_i) # insert leading zero to minutes if minutes number is one digit
    else
      duration.push(i.to_i)
    end
  }
  fastest_route = duration.each_with_index.min
  fastest_route_index = fastest_route[1]
  puts duration
  puts fastest_route
  return fastest_route_index
end
