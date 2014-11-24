class Order < ActiveRecord::Base
	has_many :order_items, :dependent => :destroy
	has_many :products, :through => :order_items

	validates :table, presence:true
end
