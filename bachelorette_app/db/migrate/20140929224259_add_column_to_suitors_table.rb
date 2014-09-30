class AddColumnToSuitorsTable < ActiveRecord::Migration
  def change
    add_column(:suitors, 	:age, 						:integer)
  end
end
