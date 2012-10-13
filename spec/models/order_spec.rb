require 'spec_helper'

describe Order do
	context "#validations" do
		it 'should not save an invalid order' do
			subject.save.should be_false
		end

		it 'should save a valid order' do
			subject.customer = FactoryGirl.create(:customer)
			subject.merchant = FactoryGirl.create(:merchant)
			subject.total = 30
			subject.save.should be_true
		end
	end

	context "#import tab delimited data" do
		it "should parse a tab delimited file and save orders" do
			data = File.read("#{Rails.root}/example_input.tab")
			result = Order.import_from_text_file data, { headers: true, col_sep: "\t" }
			result[:success].length.should eq(4)
			result[:failed].length.should eq(0)
			result[:revenue].should eq(95)
		end
	end
end