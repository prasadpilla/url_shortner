class UrlMap < ActiveRecord::Base

 validates_presence_of :actual_url
 validates_presence_of :hex_code
 validates :hex_code,:uniqueness => { case_sensitive:true }

	def self.generate_hex(char_count,tries_count=0)
		hex_token = SecureRandom.hex(char_count)
		if self.exists?(hex_code:hex_token)
			tries_count+=1
			generate_hex(char_count,tries_count)
			if tries_count > 20
				generate_hex(char_count+=1)
			end
		else
			return hex_token
		end
	end

end
