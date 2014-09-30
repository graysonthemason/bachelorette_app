class RoseCeremonyController < ApplicationController
	def index
		id = params["bachelorette_id"]
		@b = Bachelorette.find(id)
		@suitors = @b.suitors
	end
	def create


		
	redirect_to("/bachelorettes/#{params['bachelorette_id']}")
	end
end