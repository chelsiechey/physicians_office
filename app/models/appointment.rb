class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient

  validates :date, :time, presence: true
end
