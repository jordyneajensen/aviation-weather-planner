# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    weather_index_path # Redirect to the weather page after sign-up
  end
end
