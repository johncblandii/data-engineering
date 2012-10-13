class ProductsController < ResourceController
	before_filter :require_signin
end