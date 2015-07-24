class Mission < ActiveRecord::Base

  # t.string    :name
  # t.string    :unit_serviced
  # t.datetime  :step_off_at
  # t.datetime  :return_at
  # t.boolean   :initiated, default: false
  # t.boolean   :completed, default: false

  has_many :rest_points
  has_many :dispatches

  has_many :trucks, through: :dispatches
  has_many :trailer_assignments, through: :dispatches
  has_many :soldier_assignments, through: :dispatches

  has_many :soldiers, through: :soldier_assignments
  has_many :trailers, through: :trailer_assignments

  validates :name, presence: true
  validates :unit_serviced, presence: true

  validates :step_off_at, presence: true
  validates :return_at, presence: true

  validate  :no_time_travel


  ######## v-validations #########

  def no_time_travel
    if return_at < step_off_at
      errors.add(:return_at, "Returning before you left?!?")
    end
  end




  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########

  def active_time_window
    (step_off_at...return_at)
  end

end
