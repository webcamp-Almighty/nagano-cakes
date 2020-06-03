class EndUsersController < ApplicationController
  def show
  	@end_user = EndUser.find(current_end_user.id)
  end

  def edit
  	@end_user = EndUser.find(current_end_user.id)
  end

  def update
  	@end_user = EndUser.find(current_end_user.id)
  	@end_user.update(end_user_params)
  	redirect_to end_users_path
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :postal_code)
  end
end
