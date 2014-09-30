class ProductsController < ApplicationController 
	def show
		id = params[:id]
		@product = Product.find(id)
	end
	def index
		@products = Product.all
	end
	def new
		@product = Product.new
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		product = Product.find(params[:id])
		product.update(product_params)
		redirect_to product
	end
	def create
		# @product = Product.create(params[:product])
		p = Product.create(product_params)
		redirect_to products_path
	end
	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to products_path
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
  def product_params
    params.require(:product).permit(:name, :description, :price, :image_url)
  end
end