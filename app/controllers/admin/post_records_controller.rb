class Admin::PostRecordsController < ApplicationController
  
  def index
    @post_records = PostRecord.order(created_at: :desc)
  end

  def show
    @post_record = PostRecord.find(params[:id])
  end

  def destroy
  end
end
