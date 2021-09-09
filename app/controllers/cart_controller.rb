class CartController < ApplicationController
      before_action :initialize_session
      before_action :increment_visit, only: [:index]
      before_action :load_cart
      

      def index
      end

      def create
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
