# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PrivateChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'private_messages'
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def private_speak(data)
    first_user = User.friendly.find(data['first_user_id'])
    second_user = User.friendly.find(data['second_user_id'])
    ActionCable.server.broadcast('private_messages',
      private_message: render_private_message(data['private_message'], first_user.id, second_user.id), first_user_id: data['first_user_id'], second_user_id: data['second_user_id'])
  end

  private

  def render_private_message(message, first_user_id, second_user_id)
    conversation = Conversation.between(first_user_id, second_user_id).first
    conversation.private_messages.create(body: message, from_user: current_user, user_id: first_user_id)
    ApplicationController.render(
      partial: 'messages/message',
      locals: {
        message: message,
        username: current_user
      })
  end
end
