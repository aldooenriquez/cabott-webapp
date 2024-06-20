class Branch < ApplicationRecord
  enum country: [:mexico]

  has_many :providers, dependent: :destroy
  has_many :users, dependent: :nullify
end
