class CreateBachelorettes < ActiveRecord::Migration
  def change
    create_table :bachelorettes do |t|

      t.timestamps
    end
  end
end
