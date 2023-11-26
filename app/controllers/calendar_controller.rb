class CalendarController < ApplicationController
  
  def index
    @routines = current_user.routines.all
  end
end