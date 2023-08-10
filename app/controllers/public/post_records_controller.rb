class Public::PostRecordsController < ApplicationController
  
  def new
    @form = Form::PostRecordCollection.new
  end

  def index
    @post_records = PostRecord.all
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
      redirect_to post_records_path, notice: "登録が完了しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def update
    @post_record = PostRecord.find(params[:id])
    @post_record.update
    redirect_to post_record_path(params[:id])
  end

  def destroy
  end
  
  private
  
  def post_record_collection_params
    params.require(:form_post_record_collection)
      .permit(post_records_attributes: [:training_name, :set_count, :weight, :rep_count, :availability])
  end
end
