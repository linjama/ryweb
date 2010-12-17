class AddBookingIdToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :booking_id, :integer
  end

  def self.down
    remove_column :rooms, :booking_id
  end
end
