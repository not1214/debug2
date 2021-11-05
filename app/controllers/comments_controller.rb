class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = @book.id
    if @comment.save
      render :comment
    else  
      render :error
    end
    
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    @book = Book.find(params[:book_id])
    render :comment
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
