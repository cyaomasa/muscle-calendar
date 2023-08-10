class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更が完了しました。"
      redirect_to users_path
    else
      render :edit
    end
  end
  
  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to users_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :favorite_event, :profile_image)
  end
end
