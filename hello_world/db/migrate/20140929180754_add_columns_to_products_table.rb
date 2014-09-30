class AddColumnsToProductsTable < ActiveRecord::Migration
  def change
  	add_column(:products, :name, :string)
  	add_column(:products, :price, :decimal)
  	add_column(:products, :description, :text)
  	# add_column(:timestamps)
  end
end
