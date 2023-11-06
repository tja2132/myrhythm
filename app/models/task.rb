class Task < ApplicationRecord
  belongs_to :routine
  validates :title, presence: true

  def self.with_same_routine(routine)
    if !routine.nil?
      tasks = Task.where(routine: routine.id)
    else
      tasks = ''
    end
    return tasks
  end

end
