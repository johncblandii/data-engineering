require 'spec_helper'

describe OrderItem do
	context "#validations" do
		it 'should not save an invalid order item' do
			subject.save.should be_false
		end

		it 'should save a valid order item' do
			subject.product = FactoryGirl.create(:product)
			subject.order = FactoryGirl.create(:order)
			subject.price = subject.product.price #copy it over so it does change l8r in life
			subject.quantity = 1
			subject.save.should be_true
		end
	end
end