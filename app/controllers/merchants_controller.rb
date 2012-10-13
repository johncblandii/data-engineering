class MerchantsController < ResourceController
	before_filter :require_signin
end