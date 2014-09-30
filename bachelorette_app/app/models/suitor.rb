class Suitor < ActiveRecord::Base
	belongs_to :bachelorette 
	dependent: :destroy
end
