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
    # Multiplicar el numero de adultos por el precio publico general
    total_for_adults = self.activity.public_general_price.to_f *  self.total_adults
    # Multiplicar el numero de menores por el precio publico menores
    total_for_minors = self.activity.public_minor_price.to_f * self.total_minors
    #Sumar estos dos resultados a un subtotal
    subtotal = total_for_adults + total_for_minors
    # Al final se debe de aplicar el tax por el metodo de pago de ser necesario y asignar total.
    self.total = (subtotal * 1.05).round(2) if self.payment_type == "visa_or_mastercard" && self.payment_tax?
    self.total = (subtotal * 1.05).round(2) if self.payment_type == "american_express"  && self.payment_tax?
    self.total = (subtotal).round(2) if self.payment_type == "cash" || !self.payment_tax?
  end

  private
    def set_branched_id
      last_voucher = Voucher.joins(:activity).where(activities: { provider_id: self.activity.provider.branch.id }).order(:created_at).last
      last_identifier = last_voucher&.branched_id&.split('-')&.last&.to_i || 0
      self.branched_id = "#{self.activity.provider.branch.code}-#{last_identifier + 1}"
    end
end
