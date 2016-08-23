Then(/^I sign up on a free account by '(.*)' with value '(.*)'$/) do |way, value|
	begin
		case way
			when "email"
				# It generates a random email account to be used
				value = Utils.generate_random_email if value == "null"
				@page.click_on_sign_up_free
				fail "Popup to sign up is not displayed" unless @page.sign_up_title_is_ok? "SIGN UP"
				@page.insert_email_account value
				@page.insert_signup_data
				@page.insert_user_data
				@page = WrapCreationPage.new $browser
			when "facebook"
				#not developed yet
		end
	rescue => e
		fail "Error registering user. Error: #{e}"
	end
end