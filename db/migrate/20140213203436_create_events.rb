class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.integer "user_id" # input the organizer's user_id
      t.integer "attendee_floor"
      t.integer "attendee_ceiling"
      t.integer "price_per_person"
      t.string "event_name"
      t.string "event_location"
      t.date "ante_date"
      t.time "ante_time", :default => 0
      t.date "event_date"
      t.time "event_time", :default => 0
      t.string "event_status", :default => 'New'
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end

