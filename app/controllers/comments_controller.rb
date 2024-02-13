class CommentsController < ApplicationController
  before_action :set_post

  def create
    puts 'Submitted params:', params.inspect
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'コメントが追加されました。'
    else
      redirect_to post_path(@post), alert: 'コメントの追加に失敗しました。コメントを入力してください。'
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
