class CreateTicketItemPayers < ActiveRecord::Migration
  def change
    create_table :ticket_item_payers do |t|
      t.references :item, index: true
      t.references :payer, index: true
      t.integer :percentage

      t.timestamps null: false
    end
    add_foreign_key :ticket_item_payers, :items
    add_foreign_key :ticket_item_payers, :payers
  end
end
