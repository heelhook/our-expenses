class CreateTicketBalances < ActiveRecord::Migration
  def change
    create_table :ticket_balances do |t|
      t.references :ticket, index: true
      t.references :owed_by, index: true
      t.money :amount

      t.timestamps null: false
    end
    add_foreign_key :ticket_balances, :tickets
    add_foreign_key :ticket_balances, :owed_bies
  end
end
