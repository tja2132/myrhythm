class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true

  # three day abbreviations consistent with strftime("%a")
  DAYS_OF_WEEK_ABBR = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  DAYS_OF_WEEK = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

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
        daysofweek += DAYS_OF_WEEK_ABBR[0]
      end
      if routine.tue
        daysofweek += DAYS_OF_WEEK_ABBR[1]
      end
      if routine.wed
        daysofweek += DAYS_OF_WEEK_ABBR[2]
      end
      if routine.thu
        daysofweek += DAYS_OF_WEEK_ABBR[3]
      end
      if routine.fri
        daysofweek += DAYS_OF_WEEK_ABBR[4]
      end
      if routine.sat
        daysofweek += DAYS_OF_WEEK_ABBR[5]
      end
      if routine.sun
        daysofweek += DAYS_OF_WEEK_ABBR[6]
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
    combined_hash = Hash[DAYS_OF_WEEK_ABBR.zip(DAYS_OF_WEEK)]
    if combined_hash.has_key? start_day
      combined_hash[start_day]
    else
      start_day
    end
  end
end
