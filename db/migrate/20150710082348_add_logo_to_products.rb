class AddLogoToProducts < ActiveRecord::Migration
  def change
  	add_attachment :products, :logo
  	drop_table :projects
  end
end
