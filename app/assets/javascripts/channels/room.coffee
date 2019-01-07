App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    conversation = $('#messages_list').find("[data-conversation-id='" + data['conversation_id'] + "']");
    if data['window'] != undefined
      if data['user_type'] == 'admin'
        if conversation.length == 0
          $('#messages_list').append data['window']
          conversation = $('#messages_list').find("[data-conversation-id='" + data['conversation_id'] + "']");
        else
          conversation.append data['message']

        if $('.channel_list').find('.channel').length == 0
          $('.channel_list').append data['path']
        else
          $('.channel_list').find('.channel').each ->
            if !$(this).find('.channelIpAddress').text() == data['sender_ip']
              $('.channel_list').append data['path']
      else if data['user_type'] == 'anonymous_user'
        conversation.append(data['message']);
    else
      conversation.append(data['message']);

    height = conversation.height();
    conversation.parent().scrollTop(height);

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault()
  values = $(this).serializeArray()
  if values[2]["value"] != ""
    App.room.speak values
    $(this).trigger 'reset'
  return