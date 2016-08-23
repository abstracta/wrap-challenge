class CommonElements
	include PageObject
	
		a(:free_trial_button, xpath: ".//*[@id='freeTrial']/a")
		div(:loading_icon, xpath:".//*[@id='wrap-theme']/div[2]/wm-full-screen-loading/wm-loading/div")

		# Method to click on free trial button
		def click_on_free_trial
			self.free_trial_button
		end

		def wait_loading
			exists = true

			begin
				if self.loading_icon?
					sleep 2 
				else
					exists = false
				end
			end until !exists
		end
end