class CreateAttendeeSpecifics < ActiveRecord::Migration
  def change
    create_table :attendee_specifics do |t|
    	t.references :user
    	t.references :event
    	t.string :attendee_type #Creator, Attendee, etc...
      t.timestamps
    end
    add_index :attendee_specifics, ["user_id", "event_id"]
  end
end
