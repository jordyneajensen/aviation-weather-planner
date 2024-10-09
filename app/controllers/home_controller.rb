class HomeController < ApplicationController
  def index
    if user_signed_in?
      # Render content for logged-in users
      render :index
    else
      # Optionally, redirect to the sign-in page or render a different view
      redirect_to new_user_session_path
    end
  end
end

