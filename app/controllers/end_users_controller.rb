class EndUsersController < ApplicationController
  before_action :authenticate_end_user!
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

  def hide
    @end_user = EndUser.find(current_end_user.id)
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @end_user.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    redirect_to root_path
  end

  #追加
  def edit_password
    @end_user = EndUser.new
  end

  def update_password
    if current_end_user.update_with_password(user_params)
        redirect_to root_path, success: 'パスワードを変更しました'
      else
        render :edit_password
    end
  end


  private
  def end_user_params
  	params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
     :email, :postal_code, :address, :telephone_number)
  end

  #パスワード変更用
  def user_params
        params.require(:end_user).permit(:password, :password_confirmation, :current_password)
    end
end
