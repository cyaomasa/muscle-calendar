class Admin::CategoriesController < ApplicationController
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "登録が完了しました。"
      redirect_to request.referer
    else
      flash.now[:alert] = "登録に失敗しました。"
      render :index
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.delete
    flash[:notice] = "削除が完了しました。"
    redirect_to request.referer
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
