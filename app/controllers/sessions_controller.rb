class SessionsController < ApplicationController
      def new 
      end
  
      def create
          @custumer = Custumer.find_by_email params[:email] 
          if @custumer && @custumer.authenticate(params[:password]) 
              session[:custumer_id] = @custumer.id
              redirect_to root_path, notice: 'Logged in'
          else
              flash[:alert] = 'wrong email or password'
              render :new
          end
  
      end
  
      def destroy
          session[:custumer_id] = nil 
          redirect_to root_path, notice: 'Logged out'
      end
end
