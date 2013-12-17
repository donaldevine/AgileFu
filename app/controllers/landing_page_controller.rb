class LandingPageController < ApplicationController
  # We want to skip user authentication for about and faq
  skip_before_filter :authenticate_user!

    
  def index    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end

  def about

  end

end
