class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_or_create_by_auth(auth_hash)
		session[:user_id] = @user.id

		if session[:order_id]
			@order = Order.find(session[:order_id])
			@order.update_attribute(:user_id, @user.id)
		end

		redirect_to root_path
	end

	def destroy
		session[:user_id] = nil
		session[:order_id] = nil
		redirect_to root_path
	end

	private

		def auth_hash
			request.env["omniauth.auth"]
		end

end