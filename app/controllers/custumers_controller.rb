class CustumersController < ApplicationController
      def new
            @custumer = Custumer.new
      end
    
      def create
            @custumer = Custumer.new custumer_params
            if @custumer.save
                session[:custumer_id]= @custumer.id
                redirect_to root_path, notice: "Logged in!"
            else
                render :new
            end
      end
    
        private
    
        def custumer_params
            params.require(:custumer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
            #password fields from view converted into hash and saved in the db as password digest
        end
end
