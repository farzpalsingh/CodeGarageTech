class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
  	sender = message.user
  	recipient = message.conversation.opposed_user(sender)

    broadcast_to_recipient(recipient, sender, message)
    broadcast_to_sender(sender, message)
  end

  private

  def broadcast_to_sender(user, message)
    ActionCable.server.broadcast(
      "room_channel_#{user.id}",
      message: render_message(message),
      conversation_id: message.conversation_id
    )
  end

  def broadcast_to_recipient(user, sender, message)
    ActionCable.server.broadcast(
      "room_channel_#{user.id}",
      window: render_window(user, message.conversation),
      path: render_path(sender),
      message: render_message(message),
      conversation_id: message.conversation_id,
      user_type: user.user_type,
      sender_ip: sender.ip_address
    )
  end

  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end

  # def render_window(conversation)
  #   ApplicationController.render(
  #     partial: 'conversations/conversation',
  #     locals: { conversation: conversation }
  #   )
  # end
  def render_window(user, conversation)
    ApplicationController.render_with_signed_in_user(
      user,
      partial: 'conversations/conversation',
      locals: { conversation: conversation }
    )
  end

  def render_path(anonymous_user)
    ApplicationController.render(
      partial: 'conversations/conversation_path',
      locals: { anonymous_user: anonymous_user }
    )
  end
end
