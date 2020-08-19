class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    # @comment.user_id = current_user.id
  end

  def create
    @comment = Comment.new(user_id: params[:comment][:user_id] ,topic_id: params[:comment][:topic_id],comment: params[:comment][:comment])
    # binding.pry
    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました。'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
      # redirect_to comments_new_path, danger: '投稿に失敗しました。'
    end
  end
end
