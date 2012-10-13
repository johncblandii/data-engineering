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
end