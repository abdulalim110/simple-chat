class SessionsController < ApplicationController
  def create
    username = params[:session][:username]
    if User.where(username: username).empty?
      user = User.new
      user.generate_token(username)
      last_user = User.last
      cookies.signed[:username] = username
      session[:user_token] = last_user.session_token
      redirect_to messages_path
    else
      redirect_to new_session_path, alert: "Sorry username has been input"
    end
  end

  def sign_out
    cookies.signed[:username] = nil
    user = User.where(session_token: session[:user_token]).first
    user.update(session_token: nil)
    redirect_to new_session_path, notice: "Sign out has been sucessfully"
  end
end
