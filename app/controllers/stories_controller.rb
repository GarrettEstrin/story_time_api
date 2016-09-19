class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new({title: params[:story][:title], content: params[:story][:content]})
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
