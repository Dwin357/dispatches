class Payload < ActiveRecord::Base

  belongs_to :loadable, polymorphic: true

  ######## v-validations #########

  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########

end
