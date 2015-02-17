class TicketItemPayerChangePercentage < ActiveRecord::Migration
  def change
    change_column :ticket_item_payers, :percentage, :float
  end
end
