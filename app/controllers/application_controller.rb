class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    # before_action :set_first_day_of_week, if: :user_signed_in?

    protected
  
    def configure_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :columbia_uni]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password, :remember_me]
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    # def set_first_day_of_week
    #     config.beginning_of_week = current_user.first_day_of_week
    #     config.beginning_of_week = :sunday
    # end
end