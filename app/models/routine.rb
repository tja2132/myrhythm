class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true


  def self.test_method()
    return self.start_time
  end

  def self.calculate_end_time(start_time, total_duration)
    if !start_time.nil? and !total_duration.nil?
      end_time = (start_time + (total_duration*60))
    else
      end_time = ''
    end
    return end_time
  end

  def self.all_daysofweek
    ['M','T','W', 'Th', 'F', 'Sa', 'Su']
  end

  def self.total_duration(routine)
    total_duration = 0
    tasks = Task.with_same_routine(routine)
    if !tasks.nil? and !(tasks.length.eql? 0)
      tasks.each do | task |
        if task.duration?
          total_duration = (total_duration + task.duration)
        end
      end
    end
    return total_duration
  end

end
