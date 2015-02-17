class TicketItemPayerGuessed < ActiveRecord::Migration
  def change
    add_column :ticket_item_payers, :guessed, :boolean
  end
end
