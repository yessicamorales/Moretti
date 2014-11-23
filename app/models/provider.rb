class Provider < ActiveRecord::Base
	validates :name, :contact, :phone, :address, presence:true
	has_many :provider_products
  	has_many :products, :through => :provider_products
end
