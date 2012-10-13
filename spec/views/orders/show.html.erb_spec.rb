require 'spec_helper'

describe "orders/show.html.erb" do
	it "should show the order" do
		items = [	stub_model(OrderItem, price: 10, quantity:2, product: stub_model(Product, name: "Product 1", price: 10)),
					stub_model(OrderItem, price: 111, quantity:3, product: stub_model(Product, name: "Product 2", price: 111))
				]
		merchant = stub_model(Merchant, name:"Merchant 1", address: "123 Anywhere US")
		customer = stub_model(Customer, name:"Customer 1")
		assign(:order, 
				stub_model(	Order, 
							merchant: merchant,
							customer: customer,
							total: 95,
							created_at: Time.now)
			).stub_chain(:order_items).and_return(items)
		render
		rendered.should have_content("Merchant 1")
		rendered.should have_content("123 Anywhere US")
		rendered.should have_content("Customer 1")
		rendered.should have_content("Product 1")
			rendered.should have_content("$10.00") #price
			rendered.should have_content("2") #quantity
			rendered.should have_content("$20.00") #subtotal
		rendered.should have_content("Product 2")
			rendered.should have_content("$111.00") #price
			rendered.should have_content("3") #quantity
			rendered.should have_content("333") #subtotal
		rendered.should have_content("$95.00")
	end
end