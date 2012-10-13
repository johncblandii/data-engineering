require 'spec_helper'

describe Merchant do
	context "#validations" do
		it 'should not save an invalid merchant' do
			subject.save.should be_false
		end

		it 'should save a valid merchant' do
			subject.name = "Some Merchant"
			subject.address = "Somewhere USA"
			subject.save.should be_true
		end
	end
end