class Product < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  belongs_to :category
  
  has_many :provider_products
  has_many :providers, :through => :provider_products

  has_many :order_items
  has_many :orders, :through => :order_items

  validates :description, :quantity, :price, :picture, :category_id,:name, presence:true
end
