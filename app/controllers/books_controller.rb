class BooksController < ApplicationController
      before_action :authenticate_custumer!, except: [:index, :show] #confirm the user exists prior to creating or deleting a question
      before_action :find_book, only: [:show, :edit, :update, :destroy]
      before_action :authorize_custumer!, only: [:edit, :update, :destroy]
      before_action :initialize_session
      before_action :increment_visit, only: [:index]
      before_action :load_cart

      def index 
          @books = Book.all.order(created_at: :desc)
      end
  
      def show
        @comment = Comment.new
        @comments = @book.comments.order(created_at: :desc)
      end
  
      def new
          @book = Book.new
      end
  
      def create 
          @book = Book.new book_params
          @book.custumer = current_custumer

          if @book.save
              flash[:success] = "Book created successfully!"
              redirect_to books_path
          else
              render :new
          end
      end
  
      def edit
      end
  
      def update
          if @book.update book_params 
              flash[:success] = 'Book has been updated!'
              redirect_to book_path(@book.id)
          else
              render :edit
          end
      end
  
      def destroy
          @book.destroy
          flash[:danger] = 'Book has been deleted'
          redirect_to books_path
      end

      def add_to_cart
        id = params[:id].to_i

        session[:cart] << id unless session[:cart].include?(id)
        redirect_to books_path
      end

      def remove_from_cart
        id = params[:id].to_i
        session[:cart].delete(id)
        redirect_to books_path
      end
  
    
        private
    
        def book_params
            params.require(:book).permit(:name_of_book, :description, :author, :price, :no_of_books_available, :main_img, :detail_img)
        end
    
        def find_book
            @book = Book.find params[:id]
        end
    
        def authorize_custumer!
            redirect_to root_path, alert: 'Not authorized! please try again' unless can?(:crud, @book)
        end

        def initialize_session
            session[:visit_count] ||= 0
            session[:cart] ||= []
        end

        def load_cart
            @cart = Book.find(session[:cart])
        end

        def increment_visit
            session[:visit_count] += 1
            @visit_count = session[:visit_count]
        end
end
