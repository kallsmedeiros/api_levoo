class CreateSuspects < ActiveRecord::Migration[5.1]
  def change
    create_table :suspects do |t|
      t.integer :survivor_id

      t.timestamps
    end
  end
end
