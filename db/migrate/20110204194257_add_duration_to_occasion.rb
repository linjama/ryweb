class AddDurationToOccasion < ActiveRecord::Migration
  def self.up
    add_column :occasions, :duration, :datetime
  end

  def self.down
    remove_column :occasions, :duration
  end
end
