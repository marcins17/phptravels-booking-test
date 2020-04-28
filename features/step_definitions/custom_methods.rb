require "watir"


def set_travel_point(city)
=begin
    Comment
=end
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
