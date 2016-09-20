class CommentsController < ApplicationController
  def create
    @story = Story.find params[:story_id]
    @comment = @story.comments.new comment_params
    @comment.responder = current_user.name
    @comment.save
    redirect_to story_path @story
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
