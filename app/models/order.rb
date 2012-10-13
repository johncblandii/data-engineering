class Order < ActiveRecord::Base
	belongs_to :customer
	belongs_to :merchant
	has_many :order_items

	attr_accessible :total

	validates :customer, :merchant, :total, presence: true, allow_nil: false
end