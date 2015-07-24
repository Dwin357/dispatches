class SoldierAssignment < ActiveRecord::Base

  belongs_to :dispatch
  belongs_to :soldier

  validates :dispatch, presence: true
  validates :soldier, presence: true

  validate :not_double_booked, on: :create
  validate :only_assigned_once, on: :create

##########  v-validations  ##############

  def not_double_booked
    if overlaps_planned_mission_time?
      errors.add(:soldier_assignment, "soldier would be double booked")
    end
  end

  def only_assigned_once
    if already_assigned_to_mission?
      errors.add(:soldier_assignment, "soldier assigned to mission multiple times")
    end
  end


##########  v-class  ^-validations ########


#########  ^-class  v-instance  ###########

  def mission
    dispatch.mission
  end

  def active_time_window
    dispatch.active_time_window
  end

  def soldiers_unfinished_assigment_time_ranges
    soldier.unfinished_assignment_time_ranges
  end

  def overlaps_planned_mission_time?
    proposed_window = active_time_window
    soldiers_unfinished_assigment_time_ranges.any? do |time_range|
      proposed_window.overlaps?(time_range)
    end
  end

  def already_assigned_to_mission?
    soldiers_assigned_to_mission = mission.soldiers
    me = self.soldier
    soldiers_assigned_to_mission.any? do |soldier_on_mission|
     soldier_on_mission == me
    end
  end





end
