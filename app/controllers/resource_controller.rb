class ResourceController < InheritedResources::Base
	respond_to :html

	load_and_authorize_resource

	protected
		rescue_from CanCan::AccessDenied do |exception|
			redirect_to new_user_session_path, alert: "You must sign in first."
		end
end