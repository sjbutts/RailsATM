class AtmController < ApplicationController
  def home
  	atmaction = params[:atmaction]
  	@balance = RailsATM::Application.config.balance
  	@message = ""

  	case atmaction
  	when 'withdraw'
  		#get the withdrawal amount and update the balance
  		@amount = params[:w_amount].to_f
  		if @balance >= @amount
  			@balance = @balance - @amount
  			@message = "Withdrawal complete. Thanks for your business."
  		else 
  			@message = "Haha you're broke! SUCKA! "
  		end
  	when 'deposit'
  		#get the deposit amount and update the balance
  		@amount = params[:d_amount].to_f
  		@balance = @balance + @amount
  		@message = "Deposit Complete. Thank you."
  	when 'balance'
  		#show the current balance in the message
  		@message = "Your balance is $#{@balance}"
  	end

  	RailsATM::Application.config.message = @message
  	RailsATM::Application.config.balance = @balance
  end
end
