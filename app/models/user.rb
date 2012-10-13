class User < ActiveRecord::Base
	devise 	:database_authenticatable, :registerable, :omniauthable,
			:rememberable, :trackable

	attr_accessible :username, :password, :password_confirmation, :remember_me

	validates_presence_of     :password
    validates_confirmation_of :password
    validates_length_of       :password, within: 2..20, :allow_blank => true

	def self.find_for_open_id(access_token, signed_in_resource=nil)
		data = access_token.info
		puts data.to_yaml
		if user = User.where("username = ?", data["nickname"]).first
			user
		else
			User.create!(username: data["nickname"], password: Devise.friendly_token[0,20])
		end
	end

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(username) = :value", { :value => login.downcase }]).first
		else
			where(conditions).first
		end
	end
end