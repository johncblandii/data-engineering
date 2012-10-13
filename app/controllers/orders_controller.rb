class OrdersController < ResourceController
	before_filter :require_signin
end
