class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @story_starts = ['A screaming comes across the sky.', 'It was a bright cold day in April, and the clocks were striking thirteen.', 'It was a pleasure to burn.', 'The Man in Black fled across the desert, and the Gunslinger followed.', 'The flash projected the outline of the hanged man onto the wall.', 'If you’re going to read this, don’t bother.', 'Happy families are all alike; every unhappy family is unhappy in its own way.', 'We were somewhere around Barstow on the edge of the desert...', 'It was the best of times, it was the worst of times...']
  end

  def show
    @story = Story.find(params[:id])
    @split_story = @story[:content].split(/[\r\n]+/)
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
    @story = Story.find(params[:id])
    @story.content += params[:story][:content]
    @story.save
    redirect_to story_path
  end

  def destroy
  end

end
