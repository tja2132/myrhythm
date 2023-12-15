class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable#, :omniauth_providers => [:digitalocean]

  has_many :routines, dependent: :destroy
  has_many :completions, dependent: :destroy
  validates :columbia_uni, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def get_user_routines_by_day(day)
    self.routines.where(day.downcase => true).order(:start_time)
  end

end
