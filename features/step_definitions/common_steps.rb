Given(/^a new '(.*)' browser$/) do |browser|
	begin
		#This is in case that we have more than one navigator to use
		case browser
			when "firefox"
				$browser = Watir::Browser.new :firefox
				$browser.window.maximize
		end
	rescue => e
		fail "Error opening browser. Error : #{e}"
	end
end