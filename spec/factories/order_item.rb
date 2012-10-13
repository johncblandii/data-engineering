FactoryGirl.define do 
	factory :order_item do
		product{ FactoryGirl.create(:product) }
		order{ FactoryGirl.create(:order) }
		price{ product.price }
		quantity 1
	end
end