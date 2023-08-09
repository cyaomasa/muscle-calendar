class Public::PostRecordsController < ApplicationController
  def new
    @form = Form::PostRecordCollection.new
  end

  def index
    #@post_records = PostRecord.all
  end

  def show
  end

  def edit
  end

  def create
    @form = Form::PostRecordCollection.new(post_record_collection_params)
    if @form.save
      redirect_to post_records_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
  
  private
  def post_record_collection_params
    params
      .require(:form_post_record_collection)
      .permit(post_records_attributes :training_name, :set_count, :weight, :rep_count)
  end
end
