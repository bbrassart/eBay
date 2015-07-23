class User < ActiveRecord::Base
	has_attached_file :logo, styles: {:medium => "300x300", :thumb => "100x100"}, :default_url => "http://www.worlddentalposters.com/assets/img/avatar.png"
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	has_many :products, dependent: :destroy
	has_many :bids, through: :products
	has_secure_password
	has_many :reviews, through: :products


	def self.fetch(date = Date.current)
		User.order("name ASC").where("created_at < ?", date).limit(10)
	end

	def to_s()
		[name, email].compact.join(" // ")
	end

end
