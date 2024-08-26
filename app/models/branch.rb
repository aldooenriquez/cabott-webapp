class Branch < ApplicationRecord
  enum country: [:mexico]

  has_many :providers, dependent: :destroy
  has_many :users, dependent: :nullify

  # Validación codigo con 4 digitos
  validates :code, length: { is: 4, message: "El codigo debe ser de 4 letras" }
end
