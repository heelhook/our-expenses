class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :category
      t.string :company
      t.references :paid_by, index: true
      t.boolean :reviewed

      t.timestamps null: false
    end
    add_foreign_key :tickets, :paid_bies
  end
end
