class Attendance < ApplicationRecord

  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"

  scope :invited,   -> { where(present: false) }
  scope :confirmed, -> { where(present: true) }

end
