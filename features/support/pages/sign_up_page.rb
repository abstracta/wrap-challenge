class SignUpPage < CommonElements
	include PageObject

	a(:sign_up_free_button, xpath:".//div[@class = 'row buttons'][1]//div[@class = 'hide-on-trial']//div[@class = 'buttons-desktop']//*[@ng-click='selectSelfService(plans.personal)']")
	
	#These elements can be part of another page (for example : sign_up_pop_up)
	text_field(:email_input, :class => "o-auth-input ng-pristine ng-untouched ng-valid ng-empty")
	h3(:title_popup_label,:class => "o-auth-title")
	button(:signup_popup_button, xpath: ".//ng-transclude//button[@class = 'o-auth-button']")
	text_field(:signup_popup_username, xpath: ".//input[@placeholder='Create a username']")
	text_field(:signup_popup_password, xpath: ".//input[@placeholder='Password']")
	b(:suggested_username_button, xpath: ".//ng-transclude//b[@class = 'o-auth-link']")
	text_field(:signup_popup_first_name, xpath: ".//input[@placeholder='First Name *']")
	text_field(:signup_popup_last_name, xpath: ".//input[@placeholder='Last Name *']")
	text_field(:signup_popup_company, xpath: ".//input[@placeholder='Company *']")
	text_field(:signup_popup_phone_number, xpath: ".//input[@placeholder='Phone Number']")
	button(:create_account_button, :class=> "o-auth-button")


	# Method to click on "sign up" in a free account button
	def click_on_sign_up_free
		self.sign_up_free_button_element.when_present(Utils::SHORT_TIMEOUT)
		self.sign_up_free_button
	end

	# Method to verify is title ok and if we are in the correct page
	def sign_up_title_is_ok? title
		self.title_popup_label_element.when_present(Utils::SHORT_TIMEOUT)
		self.title_popup_label == title
	end

	# Method to write an email account to sign up
	def insert_email_account email
		self.email_input_element.when_present(Utils::SHORT_TIMEOUT)
		self.email_input = email
		self.signup_popup_button
	end

	# Method to write username and password to signup
	def insert_signup_data
		self.suggested_username_button_element.when_present(Utils::SHORT_TIMEOUT)
		self.suggested_username_button_element.click
		# This can be setted in another way
		self.signup_popup_password = "12345678"
		self.create_account_button
	end

	# Method to write all the user data (by default)
	def insert_user_data
		self.signup_popup_first_name_element.when_present(Utils::SHORT_TIMEOUT)
		self.signup_popup_first_name = "Testing"
		self.signup_popup_last_name = "Tests"
		self.signup_popup_company = "Abstracta"
		self.signup_popup_phone_number = "12345678"

		puts "First name : Testing"
		puts "Last Name : Tests"
		puts "Company: Abstracta"
		puts "Phone Number : 12345678"
		
		self.create_account_button
	end
end