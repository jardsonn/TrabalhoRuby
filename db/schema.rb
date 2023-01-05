# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_05_183131) do
  create_table "carros", force: :cascade do |t|
    t.string "modelo"
    t.string "marca"
    t.float "valor_aluguel"
    t.string "placa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emprestimos", force: :cascade do |t|
    t.datetime "tempo_inicial"
    t.datetime "tempo_final"
    t.integer "carro_id", null: false
    t.string "Carro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carro_id"], name: "index_emprestimos_on_carro_id"
  end

  create_table "locadoras", force: :cascade do |t|
    t.integer "carro_id", null: false
    t.string "Carro"
    t.integer "locatario_id", null: false
    t.string "Locatario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carro_id"], name: "index_locadoras_on_carro_id"
    t.index ["locatario_id"], name: "index_locadoras_on_locatario_id"
  end

  create_table "locatarios", force: :cascade do |t|
    t.string "nome"
    t.datetime "idade"
    t.string "telefone"
    t.integer "emprestimo_id", null: false
    t.string "Emprestimo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "senha"
    t.index ["emprestimo_id"], name: "index_locatarios_on_emprestimo_id"
  end

  add_foreign_key "emprestimos", "carros"
  add_foreign_key "locadoras", "carros"
  add_foreign_key "locadoras", "locatarios"
  add_foreign_key "locatarios", "emprestimos"
end
