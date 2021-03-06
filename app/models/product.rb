class Product < ActiveRecord::Base
  validates :price, presence: true
	validates :title, presence: true, uniqueness: true
	has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100"}, :default_url => "http://daneshbonyan.isti.ir/uploads/total-product-marketing_11363.jpg"
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
	belongs_to :user
	has_many :bids
	has_many :users, through: :bids
  validates  :user, presence: true
  has_many :reviews
  has_many :users, through: :reviews

	def self.fetch(date = Date.current)
		Product.where("deadline: > ?", date)
	end

end
