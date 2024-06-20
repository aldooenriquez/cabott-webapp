class Voucher < ApplicationRecord
  before_create :assign_uuid, :set_total, :set_branched_id

  belongs_to :activity
  belongs_to :user
  self.primary_key = "id"

  enum status: [:created, :sended, :active, :done, :canceled], _default: :created
  enum payment_type: [:cash, :visa_or_mastercard, :american_express ]

  def assign_uuid
    self.id = SecureRandom.uuid if self.id.blank?
  end

  def set_total
    self.total = (self.activity.public_price.to_f * 1.05).round(2) if self.payment_type == "visa_or_mastercard" && self.payment_tax?
    self.total = (self.activity.public_price.to_f * 1.05).round(2) if self.payment_type == "american_express"  && self.payment_tax?
    self.total = (self.activity.public_price.to_f).round(2) if self.payment_type == "cash" || !self.payment_tax?
  end

  private
    def set_branched_id
      last_voucher = Voucher.joins(:activity).where(activities: { provider_id: self.activity.provider.branch.id }).order(:created_at).last
      last_identifier = last_voucher&.branched_id&.split('-')&.last&.to_i || 0
      self.branched_id = "#{self.activity.provider.branch.code}-#{last_identifier + 1}"
    end
end
