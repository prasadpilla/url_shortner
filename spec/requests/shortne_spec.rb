require 'rails_helper'

RSpec.describe ShortnerController, :type => :request do
 

	 describe "generate" do
	 	context "positive case" do
	 		it "should generate a shortned url" do
	 			post "/generate", {:actual_url => "http://www.google.com/"}
	 			response_body = JSON.parse response.body
	 			expect(response.status).to eq(200)
	 			expect(response_body["short_url"]).to be_present
	 		end
	 	end

	 	context "negetive case" do
	 		it "shouldn't generate a shortned url" do
	 			post "/generate", {:actual_url => "dhas"}
	 			response_body = JSON.parse response.body
	 			expect(response.status).to eq(200)
	 			expect(response_body["error"]).to eq("Invalid url")
	 		end
	 	end

	 end

	 describe "should redirect to the actual url" do
	 	let(:url_map) { FactoryGirl.create(:url_map)}
	 	context "" do
	 		it "" do
	 			get "/#{url_map.hex_code}"
	 			expect(response.status).to eq(302)
	 		end
	 	end
	 	 context "" do
	 		it "" do
	 		 get "/544994"
	 		 response_body = JSON.parse response.body
	 		 expect(response.status).to eq(200)
	 		 expect(response_body["error"]).to eq("No url found")
	 	  end
	 	 end
	  end

end