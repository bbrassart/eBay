class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :user
      t.references :product

      t.timestamps null: false
    end
  end
end