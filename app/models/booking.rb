class Booking < CustomerData
  has_and_belongs_to_many :rooms
  validates_presence_of   :start_time
  validates_presence_of   :end_time
end
