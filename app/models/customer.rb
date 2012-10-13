class Customer < ActiveRecord::Base
	has_many :orders

	attr_accessible :name

	validates :name, presence: true, allow_nil: false
end