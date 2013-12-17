class HomeController < ApplicationController
	
	# check auth before we do anything
	skip_before_filter :authenticate_user!
	before_filter :check_auth

	# This method will check if the user is signed in
	# if they are not it will redirect them to the landing page
	def check_auth
		# if user is not signed in go to landing page
		unless user_signed_in?
			redirect_to :controller => :landing_page
		end
	end

	def index
	end	
end

