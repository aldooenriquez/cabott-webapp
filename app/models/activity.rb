class Activity < ApplicationRecord
  belongs_to :provider

  has_many :vouchers, dependent: :destroy

  scope :by_user_branch, ->(user) {
    joins(provider: :branch).where(providers: { branch_id: user.branch_id })
  }
end
