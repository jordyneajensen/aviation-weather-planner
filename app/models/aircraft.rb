# app/models/aircraft.rb
class Aircraft < ApplicationRecord
  # Validations
  validates :registration, presence: true, 
                         uniqueness: true,
                         format: { with: /\A[A-Z0-9-]+\z/, message: "only allows uppercase letters, numbers, and hyphens" }
  
  validates :make_model, presence: true
  
  validates :max_speed, :cruise_speed, :fuel_capacity, 
            :empty_weight, :max_takeoff_weight,
            numericality: { greater_than: 0 }, 
            allow_nil: true

  validates :status, inclusion: { in: %w[active maintenance inactive retired] }

  # Scopes
  scope :active, -> { where(status: 'active') }
  scope :in_maintenance, -> { where(status: 'maintenance') }
  
  # Instance Methods
  def available_for_flight?
    status == 'active'
  end

  def needs_maintenance?
    status == 'maintenance'
  end

  def full_info
    "#{registration} - #{make_model}"
  end
end
