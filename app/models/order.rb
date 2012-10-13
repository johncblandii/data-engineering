require 'csv'

class Order < ActiveRecord::Base
	belongs_to :customer
	belongs_to :merchant
	has_many :order_items

	attr_accessible :total

	validates :customer, :merchant, :total, presence: true, allow_nil: false

	def self.import_from_text_file content, options={ headers:true }
		#hashes to cache values
		merchants = {}
		products = {}
		customers = {}
		result = { success: [], failed: [], revenue: 0 }
		CSV.parse(content, options).each do |row|
			order = Order.new
			order.merchant = merchants[row.field("merchant name")] ||= Merchant.find_or_create_by_name_and_address(row.field("merchant name"), row.field("merchant address"))
			order.customer = customers[row.field("purchaser name")] ||= Customer.find_or_create_by_name(row.field("purchaser name"))
			order.total = row.field("purchase count").to_i*row.field("item price").to_i

			if order.save
				item = OrderItem.new
				item.product = products[row.field("item description")] ||= Product.find_or_create_by_name_and_price(row.field("item description"), row.field("item price"))
				item.price = item.product.price
				item.quantity = row.field("purchase count")
				order.order_items << item
				result[:success] << order
				result[:revenue] = result[:revenue] + order.total
			else
				result[:failed] << order
			end
		end
		result
	end
end