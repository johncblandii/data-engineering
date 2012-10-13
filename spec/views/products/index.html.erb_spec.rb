require 'spec_helper'

describe "products/index.html.erb" do
	it "should list the products" do
		assign(:products, [
				stub_model(Product, name: "Test product", price: 10),
				stub_model(Product, name: "Product 2", price:1)
			])
		render
		rendered.should have_content("Test product")
		rendered.should have_content("$10.00")
		rendered.should have_content("Product 2")
		rendered.should have_content("$1.00")
	end
end