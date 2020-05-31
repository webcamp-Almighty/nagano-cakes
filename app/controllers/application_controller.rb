class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def after_sign_in_path_for(resource)
		root_path(resource) #後で変更
	end

	def after_sign_out_path_for(resource)
		root_path(resource)
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	end
end
