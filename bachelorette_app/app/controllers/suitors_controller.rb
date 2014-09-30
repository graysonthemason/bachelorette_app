require 'pry'
class SuitorsController < ApplicationController
	def index
		suitors_bank = Suitor.all
		@suitors = []
		if params[:bachelorette_id]
			suitors_bank.each do |suitor|
				@suitors.push(suitor) if suitor.bachelorette_id == params[:bachelorette_id].to_i
			end
		else
			@suitors = suitors_bank
		end
	end
	def show
		@suitor = Suitor.find(params[:id])
	end
	def edit
		@suitor = Suitor.find(params[:id])
	end
	def new
		@suitor = Suitor.new
	end
	def update
		suitor = Suitor.find(params[:id])
		suitor.update(suitor_params)
		redirect_to suitor
	end
	def create
		b = Bachelorette.find(params["suitor"]["bachelorette_id"])
		count = b.suitors.count
		s = Suitor.create(suitor_params) unless count >= 24
		redirect_to suitors_path
	end
	def destroy
		s = Suitor.find(params[:id])
		s.destroy
		redirect_to suitors_path
	end
	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
  def suitor_params
    params.require(:suitor).permit(:name, :age, :bachelorette_id, :image_url)
  end
end
