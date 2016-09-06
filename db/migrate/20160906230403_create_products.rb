class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.boolean :highlighted, default: false
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
