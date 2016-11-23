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
	 			expect(response.status).to eq(400)
	 			expect(response_body["error"]).to eq("Invalid url")
	 		end
	 	end

	 end

	 describe "process_and_redirect" do
	 	let(:url_map) { FactoryGirl.create(:url_map)}
	 	context "positive case" do
	 		it "should redirect to the actual url" do
	 			get "/#{url_map.hex_code}"
	 			expect(response.status).to eq(302)
	 		end
	 	end
	 	 context "negitive" do
	 		it "it should return no url found error" do
	 		 get "/544994"
	 		 response_body = JSON.parse response.body
	 		 expect(response.status).to eq(404)
	 		 expect(response_body["error"]).to eq("No url found")
	 	  end
	 	 end
	  end

end