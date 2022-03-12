class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :guest_code
      t.integer :plates
      t.integer :spice_level
      t.integer :extra_sauce
      t.string :note
      t.string :email

      t.timestamps
    end
  end
end
