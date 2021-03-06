class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre, limit: 255, null: false, default: ''
      t.string :correo_electronico, limit: 255, null: false, default: ''
      t.string :password_digest

      t.timestamps
    end
  end
end
