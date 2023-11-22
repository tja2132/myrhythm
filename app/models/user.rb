class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable#, :omniauth_providers => [:digitalocean]

  has_many :routines, dependent: :destroy
  validates :columbia_uni, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # instead of deleting, indicate the user requested a delete & timestamp it  
  def soft_delete
    update_attribute(:deleted_on, Time.current)  
  end  
  
  # ensure user account is active  
  def active_for_authentication?  
    super && !deleted_on
  end  
  
  # provide a custom message for a deleted account   
  def inactive_message
    !deleted_on ? super : :destroyed  
  end  

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		user.provider = auth.provider
		user.uid = auth.uid
		user.email = auth.info.email
		user.password = Devise.friendly_token[0,20]
	  end
  end
end
