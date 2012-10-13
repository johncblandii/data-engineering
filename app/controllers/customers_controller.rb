class CustomersController < ResourceController
	before_filter :require_signin
end