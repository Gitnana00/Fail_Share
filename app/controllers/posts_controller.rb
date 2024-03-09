# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: t('posts.created')
    else
      Rails logger.info @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: t('posts.updated')
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to posts_path, notice: t('posts.deleted'), status: :see_other
  end

  def search
    query = params[:q][:title_cont]
    @posts = Post.ransack(title_cont: query).result(distinct: true)
    render partial: 'posts/search_results', locals: { posts: @posts }
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :private, :anonymous, tag_ids: [])
  end
end
