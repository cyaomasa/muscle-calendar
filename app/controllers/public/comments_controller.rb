class Public::CommentsController < ApplicationController
  
  def create
    post_record = PostRecord.find(params[:post_record_id])
    comment = current_user.comments.new(comment_params)
    comment.post_record_id = post_record.id
    comment.save
    #redirect_to post_record_path(post_record)
  end

  def destroy
    Comment.find(params[:id]).destroy
    #redirect_to post_record_path(params[:post_record_id])
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
