class Public::SearchesController < ApplicationController
    
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "ユーザー"
      @users = User.looks(params[:word])
      @users_page = @users.page(params[:page]).per(8)
    else
      @post_records = PostRecord.looks(params[:word])
      @post_records_page = @post_records.page(params[:page]).per(10)
      @categories = Category.all
    end
  end
end
