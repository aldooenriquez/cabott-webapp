class User < ApplicationRecord
  enum role: [:seller, :admin]
  belongs_to :branch, optional: true
  has_many :vouchers, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_initialize :set_default_role, if: :new_record?

 def set_default_role
   self.role ||= :user
 end

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
