class AddLogoToUser < ActiveRecord::Migration
  def self.up
  	add_attachment :users, :logo
  end

  def self.down
  	remove_attachment :users, :logo
  end
end