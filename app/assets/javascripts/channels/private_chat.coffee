$(document).on 'keypress', '#private-chat-speak', (event) ->
  if event.keyCode is 13
    App.private_chat.private_speak(event.target.value)
    event.target.value = ""
    event.preventDefault()
App.private_chat = App.cable.subscriptions.create "PrivateChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if ($("#first_user").val() == data.first_user_id && $("#second_user").val() == data.second_user_id) || ($("#first_user").val() == data.second_user_id && $("#second_user").val() == data.first_user_id)
      $('#private-messages').append(data.private_message)
    # Called when there's incoming data on the websocket for this channel

  private_speak: (msg) ->
    @perform 'private_speak', private_message: msg, first_user_id: $("#first_user").val(), second_user_id: $("#second_user").val()
