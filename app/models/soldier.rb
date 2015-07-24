class Soldier < ActiveRecord::Base

  has_many  :soldier_assignments
  has_many  :resource_statuses, as: :classification

  has_many  :dispatches, through: :soldier_assignments
  has_many  :missions, through: :dispatches


  validates :name, presence: true
  validates :rank, presence: true


  ######## v-validations #########

  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########

  def unfinished_assignment_time_ranges
    soldier_assignments.where(safe_return: false).map(&:active_time_window)
  end
end
