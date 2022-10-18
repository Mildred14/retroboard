class Board < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :messages

  validates :name, presence: true
end
