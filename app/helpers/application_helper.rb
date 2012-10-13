module ApplicationHelper
	def get_nav_class route
		return raw ' class="active"' if current_page?(route)
		return "" if current_page?(route)
	end
end