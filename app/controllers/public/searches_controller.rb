class Public::SearchesController < ApplicationController
    
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "ユーザー"
      @users = User.looks(params[:word])
    else
      @post_records = PostRecord.looks(params[:word])
    end
  end
  @categories = Category.all
  
end
