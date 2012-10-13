class ApplicationController < ActionController::Base
	protect_from_forgery

	protected
		def after_sign_in_path_for resource
			importer_path
		end

		def require_signin
			return redirect_to new_user_session_path, alert: "You must sign in first." unless signed_in?
		end
end