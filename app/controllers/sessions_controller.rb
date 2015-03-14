class SessionsController < ApplicationController

	def new
	end

	def create
	
	user = User.find_by_email(params[:session][:email])
	# p"*********"
	# p params[:session][:email]
	# p"*********"
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id

			redirect_to('/about')
		else
			redirect_to('/login')
		end

	end

	def destroy

		session[:user_id] = nil
		redirect_to('/login')

	end
end
