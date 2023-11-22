class CalendarsController < ApplicationController


  def self.get_routines_by_day(day)
    case day
    when "Mon"
      Routine.where(mon: true).order(:start_time)
    when "Tue"
      Routine.where(tue: true).order(:start_time)
    when "Wed"
      Routine.where(wed: true).order(:start_time)
    when "Thu"
      Routine.where(thu: true).order(:start_time)
    when "Fri"
      Routine.where(fri: true).order(:start_time)
    when "Sat"
      Routine.where(sat: true).order(:start_time)
    when "Sun"
      Routine.where(sun: true).order(:start_time)
    else
      Routine.all.order(:start_time)
    end
  end
  def show
    @routines = Routine.all
  end

  def day
    @day = params[:day]
  end
end