class Board < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :messages
end
