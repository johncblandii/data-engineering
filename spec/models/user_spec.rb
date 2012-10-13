require 'spec_helper'

describe User do
	context "#validations" do
		it 'should not save an invalid user' do
			subject.save.should be_false
		end

		it 'should save a valid user' do
			subject.email = "jb@example.com"
			subject.password = "somepassword"
			subject.save.should be_true
		end
	end
end