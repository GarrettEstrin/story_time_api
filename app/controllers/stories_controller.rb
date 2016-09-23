class StoriesController < ApplicationController
  def index
    # stories sorted by comment count
    @stories = Story.all.sort_by{|s| s.comments.count}.reverse
    # stories sorted by date created
    @reversed_h = @stories.sort_by{|s| s.updated_at}.reverse
    # array of story starts for home page
    @story_start = rand_story_starts
  end

  def show
    @story = Story.find(params[:id])
    # split the story by carriage return
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
      redirect_to story_path(@story)
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

  def new_fork
    # if statement to see if params has an :id property
    if params[:id]
      # find the story the fork came from
      @original_story = Story.find(params[:id])
      # populate form with fork story content
      @story = Story.new({content: @original_story.content})
      # if no params, go to new story page instead of error
    else
    @story = Story.new
    end
  end

  # saves new fork to data base
  def create_new_fork
    @story = Story.new({title: params[:story][:title], content: params[:story][:content], user_id: current_user.id})
    if @story.save
      # redirect to the new fork
      redirect_to story_path(@story)
    end
  end

  def destroy
  end

  # pick a rand story start
  def rand_story_starts
    @story_starts = ['A screaming comes across the sky. /n —Thomas Pynchon, Gravity’s Rainbow', 'It was a bright cold day in April, and the clocks were striking thirteen. /n —George Orwell, 1984', 'It was a pleasure to burn. /n —Ray Bradbury, Fahrenheit 451', 'The Man in Black fled across the desert, and the Gunslinger followed. /n —Stephen King, The Gunslinger', 'The flash projected the outline of the hanged man onto the wall. /n —Arturo Perez-Reverte, The Club Dumas', 'If you’re going to read this, don’t bother. /n —Chuck Palahniuk, Choke', 'Happy families are all alike; every unhappy family is unhappy in its own way. /n —Leo Tolstoy, Anna Karenina', 'We were somewhere around Barstow on the edge of the desert... /n —Hunter S. Thompson, Fear and Loathing in Las Vegas', 'It was the best of times, it was the worst of times... /n -Charles Dickens, A Tale of Two Cities', 'Far out in the uncharted backwaters of the unfashionable end of the Western Spiral arm of the Galaxy... /n -Douglas Adams, The Hitchhikers Guide to the Galaxy']
    @rand_story = @story_starts[0 + rand(@story_starts.count)]
    @split_story = @rand_story.split('/n')
  end
end
