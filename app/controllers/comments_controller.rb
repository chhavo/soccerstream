class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.team_id = params[:team_id]
    @comment.comments = params[:comments]
    @comment.user_id = params[:user_id]
    @team_id = params[:team_id]

    if @comment.save
      redirect_to "/teams/#{@team_id}", :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.team_id = params[:team_id]
    @comment.comments = params[:comments]
    @comment.user_id = params[:user_id]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end
