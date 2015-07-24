class ResourceStatus < ActiveRecord::Base
  belongs_to  :classification, polymorphic: true

    ######## v-validations #########

  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########

end
