class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'user_status'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update_status(data)
    if data['message']
      current_user.status_message = data['message']
    end

    if data['status']
      current_user.status = data['status']
    end

    current_user.save
  end
end
