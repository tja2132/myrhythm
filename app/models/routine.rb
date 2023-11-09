class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true

  def self.all_daysofweek
    ['Mon','Tue','Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  end

  def self.get_recurrence_str(routine)
    if routine.mon and routine.tue and routine.wed and routine.thu and routine.fri and routine.sat and routine.sun
      "Daily"
    elsif !routine.mon and !routine.tue and !routine.wed and !routine.thu and !routine.fri and !routine.sat and !routine.sun
      "None"
    else
      "Weekly"
    end
  end

  def self.get_days_of_week_str(routine)
    if routine
      daysofweek = ""

      if routine.mon
        daysofweek += Routine.all_daysofweek[0]
      end
      if routine.tue
        daysofweek += Routine.all_daysofweek[1]
      end
      if routine.wed
        daysofweek += Routine.all_daysofweek[2]
      end
      if routine.thu
        daysofweek += Routine.all_daysofweek[3]
      end
      if routine.fri
        daysofweek += Routine.all_daysofweek[4]
      end
      if routine.sat
        daysofweek += Routine.all_daysofweek[5]
      end
      if routine.sun
        daysofweek += Routine.all_daysofweek[6]
      end

      return daysofweek
    end
  end

  def self.total_duration(routine)
    total_duration = 0
    tasks = Task.with_same_routine(routine)
    if !tasks.nil? and tasks.size > 0
      tasks.each do | task |
        if task.duration?
          total_duration += task.duration
        end
      end
    end
    return total_duration
  end

  def self.start_day_str(start_day)
    # these cases much match the form.select :start_day from routines _form
    case start_day
    when "Mon"
      "Monday"
    when "Tue"
      "Tuesday"
    when "Wed"
      "Wednesday"
    when "Thu"
      "Thursday"
    when "Fri"
      "Friday"
    when "Sat"
      "Saturday"
    when "Sun"
      "Sunday"
    else
      ""
    end
  end
end
