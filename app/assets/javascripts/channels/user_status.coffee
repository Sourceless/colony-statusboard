App.user_status = App.cable.subscriptions.create "UserStatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  update_status: ->
    @perform 'update_status'
