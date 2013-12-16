class SessionsController < Devise::SessionsController
	def after_sign_in_path_for(user)
		profile = Profile.find_by_user_id(current_user.id)

		unless profile.nil?
			redirect_to "/profiles/#{profile.id}"
		else
			redirect_to "/profiles/new"
		end
	end
end