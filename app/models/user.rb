class User < ActiveRecord::Base

	has_many :attendee_specifics
	has_many :feedbacks

end
