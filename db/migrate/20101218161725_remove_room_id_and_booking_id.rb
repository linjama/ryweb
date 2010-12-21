class RemoveRoomIdAndBookingId < ActiveRecord::Migration
  def self.up
    remove_column :rooms, :booking_id
    remove_column :bookings, :room_id
  end

  def self.down
    add_column :rooms, :booking_id, :integer
    add_column :bookings, :room_id, :integer
  end
end
