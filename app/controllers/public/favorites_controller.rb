class Public::FavoritesController < ApplicationController
  
  def create
    @post_record = PostRecord.find(params[:post_record_id])
    current_user.favorite(@post_record)
  end

  def destroy
    @post_record = PostRecord.find(params[:post_record_id])
    current_user.unfavorite(@post_record)
  end
  
end
