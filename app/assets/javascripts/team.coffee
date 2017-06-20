$(document).ready ->
  $('#btn-available').click( (e) ->
    App.user_status.update_status({ status: 'available' })
    e.preventDefault()
  )

  $('#btn-busy').click( (e) ->
    App.user_status.update_status({ status: 'busy' })
    e.preventDefault()
  )

  $('#btn-dnd').click( (e) ->
    App.user_status.update_status({ status: 'dnd' })
    e.preventDefault()
  )

  $('#btn-away').click( (e) ->
    App.user_status.update_status({ status: 'away' })
    e.preventDefault()
  )

  deactivate_buttons = ->
    $('.btn-status').removeClass('btn-status-active')

  set_status = (user, status) ->
    user.removeClass('user-status-available')
    user.removeClass('user-status-busy')
    user.removeClass('user-status-dnd')
    user.removeClass('user-status-away')
    user.addClass('user-status-' + status)

  App.user_status.received = (data) ->
    status = data.status
    message = data.message
    user = $('#user-' + data.id)

    if status
      deactivate_buttons()
      $('#btn-' + status).addClass('btn-status-active')
      set_status(user, status)

    if message
      $('#user-' + data.id + ' > .user-status').html(message)
