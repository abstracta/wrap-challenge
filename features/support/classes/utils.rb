class Utils
	
	SHORT_TIMEOUT = 60
	LONG_TIMEOUT = 120

	# Method to generate a random email to test
	def self.generate_random_email
		random_email = rand(36**10).to_s(36) + "@" + rand(36**10).to_s(36) + ".com"
		puts "Email to be used : #{random_email} / Password : 12345678"
		random_email
	end
end