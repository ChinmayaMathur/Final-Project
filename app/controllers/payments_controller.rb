class PaymentsController < ApplicationController
      def new
            @payment = Payment.new
      end

      def create
            @payment = Payment.new(payment_params)
            @book = Book.find params[:book_id]
            @payment.sender = current_user
            @payment.status = "pending"
            @payment.security_key = SecureRandom.hex(20)
            @payment.book = @book

            if @payment.save
                  shared_path = "http://localhost:3000/books/#{@book.id}/payments/complete?payment_id=#{@payment.id}&security_key=#{@payment.security_key}"
                  session = Stripe::Checkout::Session.create({
                        # success_url: shared_path + '/success',
                        success_url: shared_path + '&status=completed',
                        # cancel_url: shared_path + '/cancel',
                        cancel_url: shared_path + '&status=canceled',
                        payment_method_types: ['card'],
                        line_items: [{
                              amount: @payment.amount * 100,
                              currency: "CAD",
                              name: "Payment for books",
                              quantity: 1,
                              images: [
                                    'https://images.unsplash.com/photo-1602045486350-4e53a69865c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGhhbmslMjB5b3V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60'
                              ]
                        }],
                        mode: "payment"
                  })

                  redirect_to session.url
            else
                  render :new
            end
      end

      def complete
            @payment = Payment.find params[:payment_id]
            @payment.status = params[:status]
            @payment.save
            if @payment.status == "completed"
                  flash[:notice] = "Payment successfully given!"
            else
                  flash[:alert] = "Payment not completed"
            end
            redirect_to books_path
      end

      private

      def payment_params
            params.require(:payment).permit(:amount)
      end
end
