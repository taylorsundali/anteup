class Feedback < ActiveRecord::Base

	belongs_to :user #Note: "belongs_to" is a hint on where you want to put a foreign key

end
