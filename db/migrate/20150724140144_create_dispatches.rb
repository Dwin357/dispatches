class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.integer :truck_id
      t.integer :mission_id
      t.boolean :out_wire, default: false
      t.boolean :safe_return, default: false
      t.integer :miles_at_return
      t.integer :miles_at_dispatch
      t.integer :gallons_used, default: 0
      t.integer :oil_used, default: 0
      t.timestamps
    end
  end
end
