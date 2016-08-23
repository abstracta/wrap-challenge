# encoding: utf-8

require 'watir-webdriver'

AfterStep do |scenario|
end

Before do
  # We can use this method to open the browser too
end

After do |scenario|
	if scenario.failed?
		encoded_img = $browser.driver.screenshot_as(:base64)
		embed("data:image/png;base64,#{encoded_img}",'image/png')
	end
end

at_exit do
	$browser.close
end