class CommentsController < ApplicationController
    def create
      @book = Book.find(params[:book_id])
      @comment = @book.comments.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        redirect_to books_path
      else
        redirect_to book_path(@book)
      end
    end
    
    def destroy
      Comments.find_by(id: params[:id], book_id: params[:book_id]).destroy
      redirect_to books_path
    end

    private
      def comment_params
        params.require(:comment).permit(:content)
      end
end