class CommentsController < ApplicationController
      before_action :authenticate_custumer! 

      def create
            @book = Book.find params[:book_id]  
            comment_params = params.require(:comment).permit(:body)
            @comment = Comment.new comment_params
            @comment.custumer = current_custumer 
            @comment.book = @book
            @comment.save
            if @comment.persisted?
                  redirect_to book_path(@book), notice: 'comment created!'
            else
                  redirect_to book_path(@book)
            end
      end

      def destroy
            @book = Book.find params[:book_id]
            @comment = Comment.find params[:id]

            if can?(:crud, @comment)
                  @comment.destroy
                  redirect_to book_path(@book), notice: "Comment Deleted"
            else
                  redirect_to root_path, alert: "Not authorized"
            end
      end
end
