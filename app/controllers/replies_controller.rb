class RepliesController < ApplicationController
  
  before_action :set_reply, only: %i[ new destroy edit update ]

  def show

  end

  def new
        @reply = @comment.replies.build
  end

  def create
      @comment = Comment.find(params[:comment_id])
      @reply = Reply.new(reply_params)
      @reply.comment_id = @comment.id
      @reply.user_id = current_user.id
      if @reply.save
        redirect_to post_comment_path(@comment.post.id,@comment.id)
      else
        redner :new, status: :unprocessable_entity
      end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to post_comment_path(@comment.post.id,@comment.id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to post_comment_path(@comment.post.id,@comment.id)
  end

  private

    def set_reply
      @comment = Comment.find(params[:comment_id])
    end

    def reply_params
      params.require(:reply).permit(:body)
    end
end
