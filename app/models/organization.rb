class Organization < ApplicationRecord
  has_many :users
  has_many :boards, through: :users
end
