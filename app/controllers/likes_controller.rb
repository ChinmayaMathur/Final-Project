class LikesController < ApplicationController
      def create
            @book = Book.find params[:book_id]
            @like = Like.new(book: @book, custumer: current_custumer)
            if @like.save
                  flash[:notice] = "Book liked"
            else
                  flash[:alert] = @like.errors.full_messages.join(',')
            end
            redirect_to request.referrer
      end

      def destroy
            @like = current_custumer.likes.find params[:id]
            if @like.destroy
                  flash[:notice] = "Book unliked"
            else
                  flash[:alert] = "Couldn't unlike the book"
            end
            redirect_to request.referrer
      end
end
