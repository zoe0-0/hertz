class DiariesController < ApplicationController
  def index
  end

  def new
  end

  def create

    #onair 1로 업데이트
    @channel = current_user.channel
    @channel.update(onair: 1)

    #diary를 새로 생성
    @diary = Diary.new(diary_params)
    @diary.channel_id = @channel.id

    if @diary.save
      respond_to do |format|
      format.html {redirect_to :back}
      format.js {}
      end
    else
      redirect_to :back
    end

  end


  def show

  end

  def edit

    #onair 0으로 업데이트
    channel = current_user.channel
    channel.update(onair: 0)

    @diary = Diary.find(params[:id])

  end

  def update
    Diary.find(params[:id]).update(diary_params)
    channel = current_user.channel
    redirect_to "/channels/#{channel.id}/edit" unless channel.nil?
  end

  def max_update
    current_user.channel.diaries.last.update(max_audience: params[:max_audience])
  end

  def destroy
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :content)
  end

end
