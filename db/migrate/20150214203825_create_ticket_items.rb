class CreateTicketItems < ActiveRecord::Migration
  def change
    create_table :ticket_items do |t|
      t.references :ticket, index: true
      t.string :description
      t.money :amount

      t.timestamps null: false
    end
    add_foreign_key :ticket_items, :tickets
  end
end
