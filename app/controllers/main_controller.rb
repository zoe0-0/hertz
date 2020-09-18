class MainController < ApplicationController
  def main
    @channels = Channel.where(onair: 1)
    #나중에 onair 1인것만 찾기
  end
end
