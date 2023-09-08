class Public::PostRecordsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def new
    @form = Form::PostRecordCollection.new
  end

  def index
    @post_records = PostRecord.order(created_at: :desc).page(params[:page]).per(10)
    @categories = Category.all
  end

  def show
    @post_record = PostRecord.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    @form = Form::PostRecordCollection.new(post_record_collection_params)
    if @form.save(current_user)
      flash[:notice] = "登録が完了しました。"
      redirect_to homes_calendar_path
    else
      flash.now[:alert] = "登録に失敗しました。"
      render :new
    end
  end

  def update
    if @post_record.update(post_record_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to post_record_path(params[:id])
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @post_record.user_id == current_user.id
      @post_record.destroy
      redirect_to post_records_path
      flash[:notice] = "削除が完了しました。"
    else
      redirect_to post_records_path
      flash[:alert] = "他人の投稿は削除できません。"
    end
  end
  
  private
    def is_matching_login_user
      @post_record = PostRecord.find(params[:id])
      user = @post_record.user
      unless user.id == current_user.id
        redirect_to homes_calendar_path
      end
    end
    
    def post_record_params
      params.require(:post_record).permit(:training_name, :set_count, :weight, :rep_count, :start_time, :category_id)
    end

    def post_record_collection_params
      params.require(:form_post_record_collection)
        .permit(post_records_attributes: [:training_name, :set_count, :weight, :rep_count, :availability, :start_time, :category_id])
    end
end
