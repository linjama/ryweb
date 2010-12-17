class Booking < CustomerData
  has_and_belongs_to_many :rooms
  validates_presence_of   :start_time
  validates_presence_of   :end_time

	def varaamaton?		
		for room in self.rooms
			for b in room.bookings
				if(self.id != b.id)
					unless(self.start_time >= b.end_time || self.end_time <= b.start_time)
						return false
					end
				end
			end
		end		
	
		return true
	end
	
	# Returns abbreviated weekday number (Sunday = 0) when time is given
	def abbr_day_name(time)
	  I18n.t('date.abbr_day_names')[time.wday]
	end
	
	# Default time for booking (next sunday)
	def default_booking_time
	  default_time = 16
    t = Time.now
    t.end_of_week.advance(:hours => default_time-23)
  end
	  
end
