class CalendarController < ApplicationController
  
  def index
    @routines = Routine.all
  end
end