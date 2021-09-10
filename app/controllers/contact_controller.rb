class ContactController < ApplicationController
      def index
      end
  
      def create
          get_name
          params[:full_name] or params["full_name"]
          @full_name = params[:full_name]
          @email = params[:email]
      end
  
      private
  
      def get_name 
          if params[:full_name] != ''
              @full_name = params[:full_name]
          else 
              @full_name = "Chinmaya Mathur"
          end
      end
end

