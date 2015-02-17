class CreateDues < ActiveRecord::Migration
  def change
    create_table :dues do |t|
      t.references :due_by, index: true
      t.references :due_to, index: true, polymorphic: true
      t.references :due_from, index: true, polymorphic: true
      t.money :amount
      t.references :payment, index: true

      t.timestamps null: false
    end
    add_foreign_key :dues, :due_bies
    add_foreign_key :dues, :due_tos
    add_foreign_key :dues, :due_froms
    add_foreign_key :dues, :payments
  end
end
