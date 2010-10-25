class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name
      t.text :content
      t.integer :customer_id
      t.boolean :public
      t.datetime :valid_from
      t.datetime :valid_until
      t.integer :receivers

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
