# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :initial_signed_in, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
  def initial_signed_in
    # 최초 접속시 엽서가 3개 이하인 경우 한 장씩 쌓임
    if !current_user.nil? and current_user.last_sign_in_at < Date.today
      if current_user.postcard < 3
        current_user.update(postcard: current_user.postcard + 1)
      end
    end
  end
end
