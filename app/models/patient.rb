class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :physicians, through: :appointments, dependent: :destroy

  validates :first_name, :last_name, :phone_number, :email, presence: true

  def patient_full_name
    "#{self.first_name} #{self.last_name}"
  end

  def find_patient_physician
    "#{@patient.physicians.length <= 0 ? 'No Physicians' : @patient.list_physicians}"
  end
end
