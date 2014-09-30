class CreateSuitors < ActiveRecord::Migration
  def change
    create_table :suitors do |t|

      t.timestamps
    end
  end
end
