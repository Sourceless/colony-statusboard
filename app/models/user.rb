class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_default_status

  VALID_STATUSES = [
    'available',
    'busy',
    'do not disturb',
    'away'
  ]

  validates :status, inclusion: VALID_STATUSES

  private
  def set_default_status
    self.status = 'away'
  end
end
