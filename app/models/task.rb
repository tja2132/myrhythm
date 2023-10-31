class Task < ApplicationRecord
  belongs_to :routine

  validates :title, presence: true
end
