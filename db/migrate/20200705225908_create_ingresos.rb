class CreateIngresos < ActiveRecord::Migration[6.0]
  def change
    create_table :ingresos do |t|

      t.timestamps
    end
  end
end
