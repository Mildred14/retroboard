class Message < ApplicationRecord
  belongs_to :board
  belongs_to :author, class_name: "User"

  validates :content, presence: true
end
