FactoryGirl.define do
	factory :merchant do
		sequence(:name){ |n| "Merchant #{n}" }
		address "Somewhere USA"
	end
end