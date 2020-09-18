class ChannelsController < ApplicationController


  def index
  end

  def new
    #channel = Channel.find_by(user_id: current_user.id)
    channel = current_user.channel
    redirect_to "/channels/#{channel.id}/edit" unless channel.nil?
    @channel = Channel.new
  end

  def create
    @channel
    if Channel.find_by(frequency: params[:channel][:frequency].to_s).nil?
      @channel = Channel.new(channel_params)
      @channel.user_id = current_user.id
      @channel.save
    else
      redirect_to :back
    end
      redirect_to "/channels/#{@channel.id}/edit"
  end

  def show
    @current_channel = Channel.find_by(frequency: params[:frequency])
    @channel_title = @current_channel.title
    @stories = @current_channel.stories
    @channel_frequency = params[:frequency]
    @diary = Diary.new
  end

  def edit
    @channel = current_user.channel
    # @frequency = @channel.frequency
    @diaries = @channel.diaries.order("created_at DESC")
  end

  def update
    # update
    @channel = current_user.channel
    if @channel.update(channel_params)

    else

    end
  end

  def destroy
  end

  private
  def channel_params
    params.require(:channel).permit(:frequency, :title)
  end

end
