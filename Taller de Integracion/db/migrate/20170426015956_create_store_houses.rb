class CreateStoreHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :store_houses do |t|
      t.int :usedSpace
      t.int :totalSpace
      t.boolean :reception
      t.boolean :dispatch
      t.boolean :external

      t.timestamps
    end
  end
end
