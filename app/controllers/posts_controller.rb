class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    # Ransackの検索オブジェクトを作成
    @q = Post.ransack(params[:q])
    # 検索結果を取得し、作成日時の降順で並び替える
    @posts = @q.result.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: '投稿が作成されたよ！'
    else
      puts @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '更新完了だよ！'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to posts_path, notice: '削除完了だよ！', status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :private, :anonymous, :tag_ids => [])
  end
end
