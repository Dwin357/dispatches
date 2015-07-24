class Dispatch < ActiveRecord::Base
  # t.integer :truck_id
  # t.integer :mission_id
  # t.boolean :out_wire, default: false
  # t.boolean :safe_return, default: false
  # t.integer :miles_at_return
  # t.integer :miles_at_dispatch
  # t.integer :gallons_used
  # t.integer :oil_used

  belongs_to  :truck
  belongs_to  :mission
  has_many    :soldier_assignments
  has_many    :soldiers, through: :soldier_assignments
  has_many    :trailer_assignments
  has_many    :trailers, through: :trailer_assignments

  validates :truck, presence: true, uniqueness: {scope: :mission}, on: :create
  validates :mission, presence: true, on: :create
  validates :miles_at_dispatch, presence: true, on: :create

  validate :truck_not_double_booked, on: :create


 ########  Validations  #######

  def truck_not_double_booked
    if overlaps_planned_mission_time?
      errors.add(:truck, "truck would be double booked")
    end
  end

######## ^-validation  v-class  ########

######## ^-class  v-instance  ########

  def active_time_window
    mission.active_time_window
  end

  def trucks_unfinished_dispatch_time_ranges
    truck.unfinished_dispatch_time_ranges
  end

  def overlaps_planned_mission_time?
    proposed_window = active_time_window
    trucks_unfinished_dispatch_time_ranges.any? do |time_range|
      proposed_window.overlaps?(time_range)
    end
  end

end
