class CommentsController < ApplicationController
  def create
    # find story by id
    @story = Story.find params[:story_id]
    # find comments for story
    @comment = @story.comments.new comment_params
    # find commenters name
    @comment.responder = current_user.name
    # save the comment
    @comment.save
    redirect_to story_path @story
  end

  private
  def comment_params
    # only permit the body property
    params.require(:comment).permit(:body)
  end
end
