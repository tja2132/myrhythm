class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true


  def self.test_method()
    return self.start_time
  end

  def self.all_daysofweek
    ['M','T','W', 'Th', 'F', 'Sa', 'Su']
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
