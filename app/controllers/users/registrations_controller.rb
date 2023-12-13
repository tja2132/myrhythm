# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    '/routines'
  end

end
