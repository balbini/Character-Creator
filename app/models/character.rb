class Character < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :party, optional: true
end
