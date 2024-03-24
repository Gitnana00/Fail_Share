class LikesController < ApplicationController
  before_action :find_post

  def create
    @post_like = Like.new(user_id: current_user.id, post_id: @post.id)
    if @post_like.save
      redirect_to @post
    else
      redirect_to @post, alert: t('flash.likes.create.error')
    end
  end

  def destroy
    @post_like = @post.likes.find_by(user_id: current_user.id)
    if @post_like&.destroy
      redirect_to @post
    else
      redirect_to @post, alert: t('flash.likes.destroy.error')
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
