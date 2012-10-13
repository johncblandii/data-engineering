require 'spec_helper'

describe Product do
	context "#validations" do
		it 'should not save an invalid product' do
			subject.save.should be_false
		end

		it 'should save a valid product' do
			subject.name = "Product 1"
			subject.price = 10
			subject.save.should be_true
		end
	end
end