class AttendeeSpecifics < ActiveRecord::Base

	belongs_to :event
	belongs_to :attendee, :class_name => "User", :foreign_key => "user_id"

end
