class Admin::PostRecordsController < ApplicationController
  
  def index
    @post_records = PostRecord.order(created_at: :desc)
  end

  def show
    @post_record = PostRecord.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post_record = PostRecord.find(params[:id])
    @post_record.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to admin_post_records_path
  end
end
