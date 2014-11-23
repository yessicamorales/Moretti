class ProviderProduct < ActiveRecord::Base
	belongs_to :provider
	belongs_to :product
end
