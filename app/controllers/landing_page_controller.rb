class LandingPageController < ApplicationController

  # check auth before we do anything
  #skip_before_filter :authenticate_user!
  before_filter :check_auth, only: :index
    
  def index
    render :layout => 'landing'
  end

  def about

  end

  # methods below this will be private
  private

  # Check if the user is signed in
  def check_auth
    # if user is signed in go to projects
    if user_signed_in?
      redirect_to :controller => :projects
    end
  end
end
