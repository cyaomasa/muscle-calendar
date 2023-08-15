class Public::CategoriesController < ApplicationController
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @post_records = PostRecord.where(category_id: params[:id]).page(params[:page]).per(10)
  end
end
