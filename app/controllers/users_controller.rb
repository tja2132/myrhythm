class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update_settings ]

  # GET /users/1
  def show
  end

  # user_update_settings
  # PUT    /user/:user_id/update_settings(.:format)
  def update_settings

    @user.default_calendar = params[:user][:default_calendar]
    @user.default_insights = params[:user][:default_insights]
    # @user.first_day_of_week = params[:user][:first_day_of_week]

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/me", notice: "User settings updated" }
        format.json { render :show, status: :updated }
      end
    end

  end

  private
  
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:id).permit(:default_calendar, :default_insights)
  end

end
