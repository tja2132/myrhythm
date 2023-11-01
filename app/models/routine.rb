class Routine < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  validates :title, presence: true

  def self.all_daysofweek
    ['M','T','W', 'Th', 'F', 'Sa', 'Su']
  end

end
