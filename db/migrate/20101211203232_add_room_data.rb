class AddRoomData < ActiveRecord::Migration
  def self.up
    Room.delete_all
    Room.create(:id => 1, :customer_id => 1, :name => 'Sakasti', 
      :description => 'max 15 hlö', :created_at => Time.now, 
      :updated_at => Time.now)
    Room.create(:id => 2, :customer_id => 1, :name => 'Sali', 
      :description => '300 hlö, videotykki', :created_at => Time.now, 
      :updated_at => Time.now)
    Room.create(:id => 3, :customer_id => 1, :name => 'Kahvio', 
      :description => 'max 150 hlö', :created_at => Time.now, 
      :updated_at => Time.now)
    Room.create(:id => 4, :customer_id => 1, :name => 'Kerhohuone', 
      :description => 'max 30 hlö, matalat penkit', :created_at => Time.now, 
      :updated_at => Time.now)

  end

  def self.down
    Room.delete_all
  end
end
