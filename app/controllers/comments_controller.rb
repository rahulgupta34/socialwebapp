class CommentsController < ApplicationController

  before_action :set_comment, only: %i[ new show edit update destroy ]

  def new
    @comment = @post.comments.build
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_comment_path(@post.id,@comment.id) 
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def create
      @comment = Comment.new(comment_params)
      @comment.post_id = params[:post_id]
      @comment.user_id = current_user.id
      @comment.commentor_email = current_user.email
      if @comment.save
          redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_comment_path(@post.id,@comment.id)
  end

  private
   def comment_params
    params.require(:comment).permit(:body)
   end

   def set_comment
    @post = Post.find_by(id: params[:post_id]) 
   end
end
