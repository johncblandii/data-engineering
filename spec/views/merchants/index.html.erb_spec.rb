require 'spec_helper'

describe "merchants/index.html.erb" do
	it "should list the merchants" do
		assign(:merchants, [
				stub_model(Merchant, name: "Test Name"),
				stub_model(Merchant, name: "Merchant 2")
			])
		render
		rendered.should have_content("Test Name")
		rendered.should have_content("Merchant 2")
	end
end