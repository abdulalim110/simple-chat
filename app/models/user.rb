class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_many :conversations, :foreign_key => :first_user_id
  has_many :private_messages
  def generate_token(username)
    token = SecureRandom.hex
    if User.find_by(session_token: token).nil?
      self.username = username
      self.session_token = token
      self.save
    else
      generate_token
    end
  end
end
