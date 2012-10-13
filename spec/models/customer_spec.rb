require 'spec_helper'

describe Customer do
	context "#validations" do
		it 'should not save an invalid customer' do
			subject.save.should be_false
		end

		it 'should save a valid customer' do
			subject.name = "Some Customer"
			subject.save.should be_true
		end
	end
end