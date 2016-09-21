class StoriesController < ApplicationController
  def index
    @stories = Story.all
    # @stories = @stories.sort
    @story_start = rand_story_starts
  end

  def show
    @story = Story.find(params[:id])
    @split_story = @story[:content].split('/[\r\n]+/')
    @user = User.all
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
    @story.content += "\r\n" + " " + params[:story][:content]
    @story.save
    redirect_to story_path
  end

  def destroy
  end

  def rand_story_starts
    @story_starts = ['A screaming comes across the sky. /n —Thomas Pynchon, Gravity’s Rainbow', 'It was a bright cold day in April, and the clocks were striking thirteen. /n —George Orwell, 1984', 'It was a pleasure to burn. /n —Ray Bradbury, Fahrenheit 451', 'The Man in Black fled across the desert, and the Gunslinger followed. /n —Stephen King, The Gunslinger', 'The flash projected the outline of the hanged man onto the wall. /n —Arturo Perez-Reverte, The Club Dumas', 'If you’re going to read this, don’t bother. /n —Chuck Palahniuk, Choke', 'Happy families are all alike; every unhappy family is unhappy in its own way. /n —Leo Tolstoy, Anna Karenina', 'We were somewhere around Barstow on the edge of the desert... /n —Hunter S. Thompson, Fear and Loathing in Las Vegas', 'It was the best of times, it was the worst of times... /n -Charles Dickens, A Tale of Two Cities']
    @rand_story = @story_starts[0 + rand(@story_starts.count)]
    @split_story = @rand_story.split('/n')
  end
end
