Given(/^I navigate to wrap homepage$/) do
	begin
		# This can be opened from a configuration file, or we can create a class to handle all the urls of
		# the system.
		$browser.goto "https://www.qa.wrapdev.net/"
		@page = HomePage.new $browser
		fail "We are not in HomePage!" unless @page.are_we_in_home_page?
	rescue => e
		fail "Error opening page. Error : #{e}"
	end
end

Then(/^I click on free trial button in homepage$/) do
	begin
		@page.click_on_free_trial
		@page = SignUpPage.new $browser
	rescue => e
		fail "Error clicking on free trial button. Error: #{e}"
	end
end