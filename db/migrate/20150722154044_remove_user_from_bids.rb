class RemoveUserFromBids < ActiveRecord::Migration
  def change
    remove_column :bids, :user, :integer
  end
end
