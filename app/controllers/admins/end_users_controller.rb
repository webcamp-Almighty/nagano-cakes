class Admins::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@end_users = EndUser.all
    @end_users = EndUser.page(params[:page]).per(15)
  end

  def show
  	@end_user = EndUser.find(params[:id])
  end

  def edit
  	@end_user = EndUser.find(params[:id])
  end

  def update
  	@end_user = EndUser.find(params[:id])
  	  if  @end_user.update(end_user_params)
  	    redirect_to admins_end_users_path
      else
        render edit
      end
  end

    private
      def end_user_params
        params.require(:end_user).permit(:last_name, :first_name, :last_name_kana,
                                     :first_name_kana, :email, :telephone_number,
                                     :postal_code, :address, :is_deleted)
      end
end
