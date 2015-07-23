class CreateProducts < ActiveRecord::Migration
	def change
		create_table :projects do |t|
			t.string :title
			t.text	 :description
			t.date :deadline

			t.timestamps
    	end
  	end
end
