class TrailerAssignment < ActiveRecord::Base

  belongs_to :trailer
  belongs_to :dispatch

  validates :dispatch, presence: true
  validates :trailer, presence: true #, uniqueness: {scope: :mission}

  ######## v-validations #########

  ######## ^-validation  v-class  ########

  ######## ^-class  v-instance  ########

end

