class HomePage < CommonElements
	include PageObject

		h2(:homepage_identificator, xpath: ".//*[contains(text(), 'What is wrap?')]")

		# Method to validate if on the page is displayed a h2 with "What is wrap?" text
		def are_we_in_home_page?
			self.homepage_identificator_element.when_present
			self.homepage_identificator?
		end
end