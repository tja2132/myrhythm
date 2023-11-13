class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true

  # three day abbreviations consistent with strftime("%a")
  def self.get_days_of_week()
     ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  end

  def self.get_recurrence_str(routine)

    alldaysofweek = Routine.get_days_of_week()
    alldaysofweek = alldaysofweek.map { |day| day.downcase }
    columns = alldaysofweek.join(',')
    days = Routine.where(id: routine.id).pick(columns)

    if !days.include?(false)
      return "Daily"
    elsif !days.include?(true)
      return "None"
    else
      "Weekly"
    end
  end

  def self.get_days_of_week_str(routine)

    alldaysofweek = Routine.get_days_of_week()
    alldaysofweek = alldaysofweek.map { |day| day.downcase }
    
    daysofweek = []
    alldaysofweek.each do |day| 
      if routine.read_attribute(day)
        daysofweek.append(day.capitalize)
      end
    end

    return daysofweek.join(', ')

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
