class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new({title: params[:story][:title], content: params[:story][:content], user_id: current_user.id})
    if @story.save
      # redirect to new question
      redirect_to stories_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
