class Truck < ActiveRecord::Base

  has_many :deficiencies, as: :breakable
  has_many :payloads, as: :loadable
  has_many :resource_statuses, as: :classification
  has_many :dispatches
  has_many :missions, through: :dispatches

  validates :name, presence: true
  validates :model, presence: true
  validates :odometer, presence: true

  ######## v-validations #########

  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########

  def unfinished_dispatch_time_ranges
    dispatches.where(safe_return: false).map(&:active_time_window)
  end


end
