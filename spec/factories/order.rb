FactoryGirl.define do
	factory :order do
		customer{ FactoryGirl.create(:customer) }
		merchant{ FactoryGirl.create(:merchant) }
		total 30
	end
end