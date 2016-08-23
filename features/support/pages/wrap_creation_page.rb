class WrapCreationPage < CommonElements
	include PageObject

	button(:create_new_wrap_button, :class => "wraps_create-btn")
	button(:create_wrap_button, xpath: ".//wm-template-subcategory[1]//button[@class = 'btn btn-success']")
	button(:close_tutorial_button, xpath: ".//div[@class = 'help-tour']//button[@ng-click = 'ctrl.$close()']")
	button(:publish_wrap_button, xpath:".//div[@class = 'action-bar_item action-bar_item--narrow']//button[@class = 'btn btn-success']")
	h4(:published_title_message, :class => "modal-title text-center")
	
	# Method to verify if we are in the correct page
	def correct_page?
		# That's because create_new_wrap_button_element.wait_until_present is deprecated
		$browser.button(:class => "wraps_create-btn").wait_until_present(Utils::LONG_TIMEOUT)
		self.create_new_wrap_button?
	end

	# Method to click on "Create new wrap"
	def create_new_wrap
		# This method is in CommonElements
		wait_loading
		self.create_new_wrap_button
	end

	# Method to select a template to create a wrap. Template name is taken by parameter
	def select_template template
		page_div = $browser.div(:xpath => "//div[@class='template-categories_category-name'][contains(text(), '"+template+"')]")
		page_div.click
	end

	# Method to finish the creation of the wrap. Then closes the tutorial
	def create_wrap_click
		self.create_wrap_button_element.when_present(Utils::SHORT_TIMEOUT)
		self.create_wrap_button
		close_tutorial
	end

	# Method to publish a wrap
	def publish_wrap
		self.publish_wrap_button_element.when_present(Utils::SHORT_TIMEOUT)
		self.publish_wrap_button
		close_tutorial
	end

	# Method that returns the title of the published wrap
	def wrap_publish_result title
		self.published_title_message_element.when_present(Utils::SHORT_TIMEOUT)
		self.published_title_message == title
	end

	private
	# Private method to close tutorial
	def close_tutorial
		self.close_tutorial_button_element.when_present(Utils::LONG_TIMEOUT)
		self.close_tutorial_button
	end
end