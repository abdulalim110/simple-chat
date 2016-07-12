class MessagesController < ApplicationController
  def index
    @users = User.where.not(session_token: nil, session_token: session[:user_token])
    @messages = Message.order(created_at: :asc)
    if cookies.signed[:username].blank?
      redirect_to new_session_path, alert: "please sign in first"
    end
  end

  def private_chat
    @first_user = User.where(session_token: session[:user_token]).first
    @second_user = User.friendly.find(params[:user_id])
    if @first_user.nil?
      conversation = nil
    else
      if Conversation.between(@first_user.id, @second_user.id).empty?
        Conversation.create(first_user_id: @first_user.id, second_user_id: @second_user.id)
      end
      conversation = Conversation.between(@first_user.id, @second_user.id).first
    end
    @messages = conversation.nil? ? [] : conversation.private_messages.order(created_at: :asc)
  end
end
