class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page]).per(8)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to request.referer
  end
end
