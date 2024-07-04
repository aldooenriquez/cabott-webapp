class Activity < ApplicationRecord
  before_create :set_minor_prices_if_blank
  belongs_to :provider

  has_many :vouchers, dependent: :destroy

  scope :by_user_branch, ->(user) {
    joins(provider: :branch).where(providers: { branch_id: user.branch_id })
  }

  def set_minor_prices_if_blank
    self.provider_minor_price = self.provider_general_price if self.provider_minor_price.blank?
    self.public_minor_price = self.public_general_price if self.public_minor_price.blank?
  end
end
