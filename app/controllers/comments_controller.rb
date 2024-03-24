class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:create]

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

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: t('comments.updated')
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: t('comments.destroyed')
  end  

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end
end
