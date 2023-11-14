class CalendarsController < ApplicationController


  def self.get_routines_by_day
    # map each day to an array of routines occurring on that day
    routine_by_day = {}

    Routine.all.order(:start_time).each do |routine|
      Routine.get_days_of_week.each do |day|
        if Routine.get_days_of_week_str(routine).include? day
          unless routine_by_day.has_key? day
            routine_by_day[day] = []
          end
          routine_by_day[day].append routine
        end
      end
    end

    return routine_by_day
  end
  def show
    @routines = Routine.all
  end

  def day
    @day = params[:day]
  end
end