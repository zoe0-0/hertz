class StoriesController < ApplicationController
  def index
  end

  def new
  end

  def create
    # story 생성
    story = Story.new(story_params)
    story.user_id = current_user.id
    story.save
    current_user.update(postcard: current_user.postcard - 1)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


    private
    def story_params
      params.require(:story).permit(:content, :channel_id)
    end
end
