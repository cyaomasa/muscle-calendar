class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :set_user, only: [:favorites]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @post_records = @user.post_records.all.order(created_at: :desc)
    favorites = Favorite.where(user_id: @user.id).pluck(:post_record_id)
    @favorite_post_records = PostRecord.find(favorites)
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
      if @user.guest_user?
        redirect_to users_path, notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
      end
    end
    
    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to post_records_path
      end
    end
    
    def user_params
      params.require(:user).permit(:name, :favorite_event, :profile_image)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
  
end
