class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :danka_number,          null: false
      t.string :cemetery_number,       null: false
      t.integer :cemetery_type_id,     null: false
      t.integer :cost,                 null: false
      t.integer :cost_pay_id,          null: false
      t.references :admins,         null: false, foreign_key: true
      t.timestamps 
    end
  end
end
