class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  def index
  end

  def edit
  end

  def update
  end
  
  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to users_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end
