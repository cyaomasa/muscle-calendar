class Public::FavoritesController < ApplicationController

  def index
  end

  def create
    post_record = PostRecord.find(params[:post_record_id])
    favorite = current_user.favorites.new(post_record_id: post_record.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post_record = PostRecord.find(params[:post_record_id])
    favorite = current_user.favorites.find_by(post_record_id: post_record.id)
    favorite.destroy
    redirect_to request.referer
  end
  
end
