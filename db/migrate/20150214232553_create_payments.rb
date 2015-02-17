class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :paid_by, index: true
      t.references :paid_to, index: true
      t.money :amount
      t.text :memo

      t.timestamps null: false
    end
    add_foreign_key :payments, :paid_bies
    add_foreign_key :payments, :paid_tos
  end
end
