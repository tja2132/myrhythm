class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true

  # three day abbreviations consistent with strftime("%a")
  def self.get_days_of_week()
    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
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
        daysofweek += get_days_of_week[0]
      end
      if routine.tue
        daysofweek += get_days_of_week[1]
      end
      if routine.wed
        daysofweek += get_days_of_week[2]
      end
      if routine.thu
        daysofweek += get_days_of_week[3]
      end
      if routine.fri
        daysofweek += get_days_of_week[4]
      end
      if routine.sat
        daysofweek += get_days_of_week[5]
      end
      if routine.sun
        daysofweek += get_days_of_week[6]
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
end
