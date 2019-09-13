class Physician < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments, dependent: :destroy

  validates :first_name, :last_name, :phone_number, :email, :specialty, presence: true

  def physician_full_name
    "#{self.first_name} #{self.last_name}"
  end
end
