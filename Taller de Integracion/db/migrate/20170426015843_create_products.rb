class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :storeHouseId
      t.double :cost

      t.timestamps
    end
  end
end
