class CreateProductsForUsers < ActiveRecord::Migration
	def change

		create_table :products do |t|
			t.integer  :user_id
			t.string :title
			t.text	 :description
			t.date :deadline

			t.timestamps
    	end
  	end
end
