class Client < ActiveRecord::Base
	has_many :events
	validates :name, :presence => true
	validates :phone, :presence => true

end
