class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :hydration_liquid
      t.integer :food
      t.integer :medication
      t.integer :ammunition

      t.timestamps
    end
  end
end
