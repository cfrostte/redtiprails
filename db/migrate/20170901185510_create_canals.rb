class CreateCanals < ActiveRecord::Migration[5.1]
  def change
    create_table :canals do |t|
      t.string :nombre
      t.string :imagen
      t.boolean :estado

      t.timestamps
    end
  end
end
