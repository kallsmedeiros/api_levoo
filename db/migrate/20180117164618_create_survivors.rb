class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.boolean :infected
      t.float :latitude
      t.float :longitude
      t.integer :inventory_id

      t.timestamps
    end
  end
end
