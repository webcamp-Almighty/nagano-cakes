class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	add_flash_types :success, :info, :warning, :danger

	protected

	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_top_path
		when EndUser
			root_path
		end
	end

	def after_sign_out_path_for(resource)
		if resource == :admin
			new_admin_session_path
		else
			new_end_user_session_path
		end

	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys: [:last_name,
		 :first_name, :last_name_kana, :first_name_kana,
		 :telephone_number, :postal_code, :address, :is_deleted])
	end

    def reject_user #退会した人はログインできなくする
    @end_user = User.find_by(email: params[:user][:email].downcase)
    if @end_user
      if (@end_user.valid_password?(params[:user][:password]) && (@end_user.active_for_authentication? == false))
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

end