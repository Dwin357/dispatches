# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Soldier.destroy_all if Soldier.any?
Truck.destroy_all if Truck.any?
Trailer.destroy_all if Trailer.any?

Mission.destroy_all if Mission.any?
SoldierAssignment.destroy_all if SoldierAssignment.any?
Dispatch.destroy_all if Dispatch.any?
TrailerAssignment.destroy_all if TrailerAssignment.any?

def honest_array(ar_association)
  honest_ary = []
  ar_association.each do |ar_obj|
    honest_ary << ar_obj
  end
  honest_ary
end

ranks = ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "O1", "O2", "O3"]
vech_classes = ["LMTV", "HMV", "LHS", "PLS", "915", "DropPod"]
units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf"]
missions = ["RR", "Ammo", "TrX", "Chow", "Contonement", "Trash"]

30.times do
  Soldier.create!(name:          Faker::Name.last_name,
                  rank:          ranks.sample,
                  phone_number:  Faker::PhoneNumber.phone_number,
                  weapon_number: ("E"+rand(100).to_s),
                  weapon_serial: Faker::Number.number(8),
                  cco_serial:    Faker::Number.number(10)
                  )
end

i = 0
12.times do
  i = i+1
  Truck.create!(name:      ("G" + i.to_s),
                pen_name:  ("E" + rand(100).to_s),
                model:     vech_classes.sample,
                radio_NSN: Faker::Number.number(10),
                odometer:  rand(40_000)
    )
end

j = 0
5.times do
  j = j+0
  Trailer.create!(name: ("G" + j.to_s))
end

troops = Soldier.all
trucks = Truck.all
trailers = Trailer.all

roles = ["passenger", "passenger", "a-driver", "driver"]

time = 0
5.times do

  trp = honest_array(troops)
  tk = honest_array(trucks)
  tl = honest_array(trailers)

  m = Mission.new(
    name:           missions.sample,
    unit_serviced:  units.sample,
    step_off_at:    (rand(4)+time).hours.from_now,
    return_at:      ((rand(3)+4)+time).hours.from_now
    )

  (rand(6)+1).times do

    truck = tk.shuffle.pop
    d = Dispatch.new( truck: truck,
                      miles_at_dispatch: truck.odometer )

    roles = ["passenger", "passenger", "a-driver", "driver"]
    (rand(2)+2).times do
      d.soldier_assignments << SoldierAssignment.new(
        soldier: trp.shuffle.pop,
        role: roles.pop)
    end

    rand(2).times do
      d.trailer_assignments << TrailerAssignment.new(
        trailer: tl.shuffle.pop)
    end

    m.dispatches << d
  end

  m.save!
  time = time + 9
end

