class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :location
      t.string :name
      t.references :client, index: true

      t.timestamps
    end
  end
end
