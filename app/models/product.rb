class Product < ActiveRecord::Base
	has_many :order_items

	attr_accessible :name, :price

	validates :name, :price, presence: true, allow_nil: false
end