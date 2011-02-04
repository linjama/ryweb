class AddRegionToOccasion < ActiveRecord::Migration
  def self.up
    add_column :occasions, :region, :string
  end

  def self.down
    remove_column :occasions, :region
  end
end
