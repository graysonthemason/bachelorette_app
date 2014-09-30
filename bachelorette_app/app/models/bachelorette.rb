class Bachelorette < ActiveRecord::Base
	has_many :suitors
	has_one :rose_ceremony
end
