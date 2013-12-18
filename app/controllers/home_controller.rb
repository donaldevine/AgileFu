class HomeController < ApplicationController
	
	# check auth before we do anything
	#skip_before_filter :authenticate_user!
	before_filter :check_auth

	def index
    @projects = Project.find_all_by_user_id(current_user.id)
  end

  # methods below this will be private
  private

  # This method will check if the user is signed in
  # if they are not it will redirect them to the landing page
  def check_auth
    # if user is not signed in go to landing page
    unless user_signed_in?
      redirect_to :controller => :landing_page
    end
  end
end

