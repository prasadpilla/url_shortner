class ShortnerController < ApplicationController

	def generate
		actual_url = generate_params
		if (actual_url =~ /\A#{URI::regexp(['http', 'https'])}\z/) == 0
			hex = UrlMap.generate_hex(3)
			UrlMap.create(hex_code:hex,actual_url:actual_url)
			short_url = request.base_url+"/#{hex}"
			render json: {short_url:short_url}, status: 200
		else
			render json: {error:"Invalid url"}, status: 400
		end
	end

	def process_and_redirect
		url_record = UrlMap.find_by(hex_code:process_params)
		if url_record.present?
			redirect_to url_record.actual_url, status: 302
		else
			render json: {error:"No url found"}, status: 404
		end
	end


	private
		#Strong parameters, to restrit unknown params
		def generate_params
			params.require(:actual_url)
		end

		def process_params
			params.require(:hex)
		end
end
