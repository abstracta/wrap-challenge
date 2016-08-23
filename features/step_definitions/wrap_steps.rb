Then(/^I create a new wrap$/) do
	begin
		@page = WrapCreationPage.new $browser
		fail "Page is not the wrap creation page" unless @page.correct_page?
		@page.create_new_wrap
	rescue => e
		fail "There was a problem trying to click in 'New Wrap' button. Error: #{e}"
	end
end

Then(/^I select a '(.*)' template$/) do |type|
	begin
		@page.select_template type
		@page.create_wrap_click
	rescue => e
		fail "There was a problem trying to click in 'New Wrap' button. Error: #{e}"
	end
end

And(/^I publish the wrap$/) do 
	begin
		@page.publish_wrap
		fail "There was an error in the system creating the wrap!. Title must be 'Publish Successfull' 
			but is '#{@page.published_title_message}'!" unless @page.wrap_publish_result "Publish Successful"
	rescue => e
		fail "There is a problem trying to publish the wrap!. Error : #{e}"
	end
end