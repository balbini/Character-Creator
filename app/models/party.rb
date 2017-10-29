class Party < ApplicationRecord
  has_many :characters
  belongs_to :user
end
