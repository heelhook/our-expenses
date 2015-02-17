class PaymentTicket < ActiveRecord::Migration
  def change
    add_column :payments, :ticket_id, :integer
  end
end
