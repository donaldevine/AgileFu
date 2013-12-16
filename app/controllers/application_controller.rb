class ApplicationController < ActionController::Base
  	protect_from_forgery
  	
  	def after_sign_in_path_for(resource)
		profile = Profile.find_by_user_id(current_user.id)

		unless profile.nil?
			redirect_to "/profiles/#{profile.id}"
		else
			redirect_to "/profiles/new"
		end
	end
end
