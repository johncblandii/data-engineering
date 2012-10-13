class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :order

	attr_accessible :price, :quantity

	validates :product, :order, :price, :quantity, presence: true
end