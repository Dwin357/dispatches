class RestPoint < ActiveRecord::Base
  belongs_to  :mission

  validates :mission, presence: true
  validates :point, presence: true

    ######## v-validations #########

  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########
end
