class Admin::CommentsController < ApplicationController
  
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy if @comment
  end
  
end
