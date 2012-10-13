require 'spec_helper'

describe "orders/index.html.erb" do
	it "should list the orders" do
		assign(:orders, [
				stub_model(	Order, 
							merchant: stub_model(Merchant, name:"Merchant 1", address: "123 Anywhere US"),
							customer: stub_model(Customer, name:"Customer 1"),
							total: 95)
			])
		render
		rendered.should have_content("Merchant 1")
		rendered.should have_content("Customer 1")
		rendered.should have_content("$95.00")
	end
end