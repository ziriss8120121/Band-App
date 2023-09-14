class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
   @users = User.all
  end

  def show
   @user = User.find(params[:id])
   @band = Band.new
  end

  def edit
   @user = User.find(params[:id])
   if current_user != @user
     redirect_to user_path(current_user)
   end
  end
  
  def update
    # フォームから送信されたデータを使用してユーザー情報を更新
    user = current_user
    if user.update(user_params)
      redirect_to user_path(user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end