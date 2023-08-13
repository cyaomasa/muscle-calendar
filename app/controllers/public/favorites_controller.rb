class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_record_params, only: [:create, :destroy]

  def index
  end

  def create
    Favorite.create(user_id: current_user.id, post_record_id: @post_record.id)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_record_id: @post_record.id)
    favorite.destroy
  end
  
  private
  
  def post_record_params
    @post_record = PostRecord.find(params[:post_record_id])
  end
  
end
