Feature: Code Challenge for Wrap

	Background:
		Given a new 'firefox' browser

	@test_case
	Scenario: Create a Wrap from a Template
		Given I navigate to wrap homepage
		Then I click on free trial button in homepage
		And I sign up on a free account by 'email' with value 'null'
		Then I create a new wrap
		* I select a 'Commerce' template
		And I publish the wrap
