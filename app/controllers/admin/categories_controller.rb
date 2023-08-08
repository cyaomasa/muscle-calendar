class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      redirect_to request.referer
    else
      render :index
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.delete
    redirect_to request.referer
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
  
end
