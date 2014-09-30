class WelcomeController < ApplicationController
	def index
	end
	def about
		@current_time = Time.now
	end
end	