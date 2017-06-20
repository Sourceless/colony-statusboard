class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_default_status
  after_save :send_hook

  VALID_STATUSES = [
    'available',
    'busy',
    'dnd',
    'away'
  ]

  validates :status, inclusion: VALID_STATUSES

  def friendly_name
    name.present? ? name : email.split('@').first.split('.').first.humanize
  end


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

  def send_hook
    ActionCable.server.broadcast('user_status', message: status_message, status: status, id: id)
  end
end
