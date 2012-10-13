class Merchant < ActiveRecord::Base
	has_many :orders
	attr_accessible :address, :name

	validates :name, :address, presence: true, allow_nil: false
end