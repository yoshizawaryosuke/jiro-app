class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string  :store_name,                null: false
      t.text    :store_text,                null: false
      t.integer :store_noodle_id,           null: false
      t.integer :store_soup_id,             null: false
      t.integer :store_meat_id,             null: false
      t.integer :store_vegetable_id,        null: false
      t.integer :store_garlic_id,           null: false
      t.integer :store_oil_id,              null: false
      t.references :user,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
