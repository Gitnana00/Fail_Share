# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post

  def create
    Rails.logger.info "Submitted params: #{params.inspect}"
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: t('comments.added')
    else
      redirect_to post_path(@post), alert: t('comments.add_failure')
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
