class Conversation < ApplicationRecord
  belongs_to :first_user, :foreign_key => :first_user_id, class_name: 'User'
  belongs_to :second_user, :foreign_key => :second_user_id, class_name: 'User'

  has_many :private_messages, dependent: :destroy

  validates_uniqueness_of :first_user_id, :scope => :second_user_id

  scope :involving, -> (user) do
    where("conversations.first_user_id =? OR conversations.second_user_id =?",user.id,user.id)
  end

  scope :between, -> (first_user_id,second_user_id) do
    where("(conversations.first_user_id = ? AND conversations.second_user_id =?) OR (conversations.first_user_id = ? AND conversations.second_user_id =?)", first_user_id,second_user_id, second_user_id, first_user_id)
  end
end
