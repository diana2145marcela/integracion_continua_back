class CreateGastos < ActiveRecord::Migration[6.0]
  def change
    create_table :gastos do |t|
      t.string :nombre, limit: 255, null: false, default: 'Mi gasto'
      t.date :fecha, null: 'false'
      t.decimal :monto, precision: 10, scale: 2, null: false, default: 0.00
      t.references :usuario, index: true, foreign_key: true

      t.timestamps
    end
    add_index :gastos, :nombre
    add_index :gastos, :fecha
    add_index :gastos, :monto
  end
end
