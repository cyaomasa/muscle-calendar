class Public::PostRecordsController < ApplicationController
  
  def new
    @form = Form::PostRecordCollection.new
  end

  def index
    @post_records = PostRecord.order(created_at: :desc)
  end

  def show
    @post_record = PostRecord.find(params[:id])
  end

  def edit
    @post_record = PostRecord.find(params[:id])
  end

  def create
    @form = Form::PostRecordCollection.new(post_record_collection_params)
    if @form.save(current_user)
      flash[:notice] = "登録が完了しました。"
      redirect_to post_records_path
    else
      flash.now[:alert] = "登録に失敗しました。"
      render :new
    end
  end

  def update
    @post_record = PostRecord.find(params[:id])
    if @post_record.update(post_record_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to post_record_path(params[:id])
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post_record = PostRecord.find(params[:id])
    @post_record.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to post_records_path
  end
  
  private
  
  def post_record_params
    params.require(:post_record).permit(:training_name, :set_count, :weight, :rep_count)
  end
  
  def post_record_collection_params
    params.require(:form_post_record_collection)
      .permit(post_records_attributes: [:training_name, :set_count, :weight, :rep_count, :availability, :category_ids])
  end
  
end
