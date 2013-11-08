class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all
    @comment = Comment.new

    @posts.each do |post|
      post[:comments] = post.comments
    end

    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

  def create
    @post = Post.create(params[:post])
    render json: @post, status: 201
  end
end
