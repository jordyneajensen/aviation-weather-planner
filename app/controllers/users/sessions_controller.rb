# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    weather_index_path # Redirect to the weather page after sign-in
  end
end

