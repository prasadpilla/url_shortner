require 'rails_helper'
RSpec.describe UrlMap, :type => :model do

		describe "db" do
			context "columns" do
				it { is_expected.to have_db_column(:actual_url).of_type(:string)}
				it { is_expected.to have_db_column(:hex_code).of_type(:string)}
				it { is_expected.to have_db_column(:expiry).of_type(:datetime)}
			end
		end

		describe "validations" do
			it { is_expected.to validate_presence_of(:actual_url) }
			it { is_expected.to validate_presence_of(:hex_code) }
			it { is_expected.to validate_uniqueness_of(:hex_code) }
		end


		describe "methods" do 

			describe ".generate_hex" do
				context "positive scenarios" do
					it "should return a hex_code string with a length of 6" do
	      				hex_code = described_class.generate_hex(3)
	      				hex_code.should be_a String
	      				hex_code.length.should eql 6
	   				 end
	   			end


	   			context "negitive scenarios" do
	   				subject{create(:url_map)}
	   				it "should retry generate_hex when a code already exists" do
	   					expect(described_class.generate_hex(3)).not_to eq(subject.hex_code)
	   				end
	   			end
			end

		end
		
end