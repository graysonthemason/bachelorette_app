class BachelorettesController < ApplicationController
	def index
		@bachelorettes = Bachelorette.all
	end
	def show
		@bachelorette = Bachelorette.find(params[:id])
	end
	def edit
		@bachelorette = Bachelorette.find(params[:id])
	end
	def new
		@bachelorette = Bachelorette.new
	end
	def update
		bachelorette = Bachelorette.find(params[:id])
		bachelorette.update(bachelorette_params)
		redirect_to bachelorette
	end
	def create
		b = Bachelorette.create(bachelorette_params)
		redirect_to bachelorettes_path
	end
	def destroy
		b = Bachelorette.find(params[:id])
		b.destroy
		redirect_to bachelorettes_path
	end
	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
  def bachelorette_params
    params.require(:bachelorette).permit(:name, :age, :season_id, :image_url)
  end
end
