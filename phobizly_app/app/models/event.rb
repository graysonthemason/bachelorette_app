class Event < ActiveRecord::Base
  belongs_to :client
  has_many :photos
	validates :type, :name, :location, :presence => true



end
