class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render json: @comments, status: 201
  end

  def create
    @comment = Comment.create(params[:comment])
    render json: @comment, status: 201
  end
end
