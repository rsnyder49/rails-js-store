class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
