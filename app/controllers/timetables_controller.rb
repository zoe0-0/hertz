class TimetablesController < ApplicationController
  def index
    unless params[:start_date].nil?
      start_date = DateTime.parse(params[:start_date])
      start_week = start_date.beginning_of_week
      end_week = start_date.end_of_week
    else
      start_week = Date.current.beginning_of_week
      end_week = Date.current.end_of_week
    end
 
    @timetables = Timetable.where("start > ? AND start < ?", start_week.at_beginning_of_day, end_week.at_end_of_day)
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path
    elsif current_user.channel.nil?
      redirect_to new_channel_path
    end
    @timetable = Timetable.new
  end

  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.channel_id = current_user.channel.id
    @timetable.save
    redirect_to timetables_path
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
  def timetable_params
    params.require(:timetable).permit(:start, :end)
  end
end
