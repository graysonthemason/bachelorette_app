class AddColumnsToBachelorettesTable < ActiveRecord::Migration
  def change
    add_column(:bachelorettes, 	:name, 						:string)
    add_column(:bachelorettes, 	:age, 						:integer)
 		add_column(:bachelorettes, 	:season_id, 			:integer)
 		add_column(:bachelorettes, 	:image_url, 			:string)
    add_column(:suitors, 				:name, 						:string)
    add_column(:suitors, 				:eliminated, 			:boolean, :default => false)
    add_column(:suitors, 				:winner, 					:boolean, :default => false)
    add_column(:suitors, 				:bachelorette_id, :integer,	:null    => true)
    add_column(:suitors, 				:image_url, 			:string)	
  end
end
