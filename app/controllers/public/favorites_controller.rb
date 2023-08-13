class Public::FavoritesController < ApplicationController

  def index
  end

  def create
    post_record = PostRecord.find(params[:post_record_id])
    favorite = current_user.favorites.new(post_record_id: post_record.id)
    favorite.save
    redirect_to post_record_path(post_record)
  end

  def destroy
    post_record = PostRecord.find(params[:post_record_id])
    favorite = current_user.favorites.find_by(post_record_id: post_record.id)
    favorite.destroy
    redirect_to post_record_path(post_record)
  end
  
end
