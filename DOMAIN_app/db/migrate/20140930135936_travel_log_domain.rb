class TravelLogDomain < ActiveRecord::Migration
	def change
  	create_table(:cities) do |t|
  		t.string 			:name
  	end
  	create_table(:entries) do |t|
  		t.string 			:title
  		t.text 				:body
  		t.timestamps
  		# t.references 	:city
  		# t.belongs_to 	:city
  		t.integer 		:city_id
  	end
	end
end
