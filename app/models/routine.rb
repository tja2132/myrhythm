class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  validates :title, presence: true

  def self.all_daysofweek
    ['M','T','W', 'Th', 'F', 'Sa', 'Su']
  end

  def self.total_duration(routine)
    total_duration = 0
    tasks = Task.with_same_routine(routine)
    tasks.each do | task |
      total_duration = (total_duration + task.duration)
    end
    return total_duration
  end
  
end
