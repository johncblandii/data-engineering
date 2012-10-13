require 'spec_helper'

describe "customers/index.html.erb" do
	it "should list the customers" do
		assign(:customers, [
				stub_model(Customer, name: "Test Name"),
				stub_model(Customer, name: "Customer 2")
			])

		render
		rendered.should have_content("Test Name")
		rendered.should have_content("Customer 2")
	end
end