# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_14_203310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gastos", force: :cascade do |t|
    t.string "nombre", limit: 255, default: "Mi gasto", null: false
    t.date "fecha"
    t.decimal "monto", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "usuario_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fecha"], name: "index_gastos_on_fecha"
    t.index ["monto"], name: "index_gastos_on_monto"
    t.index ["nombre"], name: "index_gastos_on_nombre"
    t.index ["usuario_id"], name: "index_gastos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre", limit: 255, default: "", null: false
    t.string "correo_electronico", limit: 255, default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "gastos", "usuarios"
end
