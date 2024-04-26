class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    start_date = Date.parse(params.fetch(:start_date, Date.today.to_s))
    @start_date = start_date.beginning_of_month
    @end_date = @start_date.end_of_month

    posts = @user.posts.where(created_at: @start_date..@end_date)
    @posts_by_date = @user.posts.where(created_at: @start_date..@end_date)
                                .group_by { |post| post.created_at.to_date }
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('users.profile_updated')
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end

