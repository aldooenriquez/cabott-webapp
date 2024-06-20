class Provider < ApplicationRecord
  belongs_to :branch

  has_many :activities, dependent: :destroy
end
