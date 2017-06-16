class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_default_status

  VALID_STATUSES = [
    'available',
    'busy',
    'dnd',
    'away'
  ]

  validates :status, inclusion: VALID_STATUSES
  validates :name, presence: true

  def friendly_status
    if status == 'dnd'
      'do not disturb'
    else
      status
    end
  end

  def available?
    self.status == 'available'
  end

  def busy?
    self.status == 'busy'
  end

  def dnd?
    self.status == 'dnd'
  end

  def do_not_disturb?
    dnd?
  end

  def away?
    self.status == 'away'
  end

  private
  def set_default_status
    self.status ||= 'away'
  end
end
