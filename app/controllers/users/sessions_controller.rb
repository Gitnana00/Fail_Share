# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to posts_path, success: 'ログイン成功！'
    else
      flash.now[:alert] = 'ログイン失敗！'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path notice: 'ログアウトしました。'
  end
end

  # before_action :configure_sign_in_params, only: [:create]

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
