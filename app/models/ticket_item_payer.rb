class TicketItemPayer < ActiveRecord::Base
  belongs_to :item, class_name: 'TicketItem', dependent: :destroy
  belongs_to :payer, class_name: 'User', dependent: :destroy
  has_one :ticket, through: :item

  after_update :update_ticket_balance

  delegate :id, to: :ticket, prefix: true

  def owed_to
    ticket_item.paid_by
  end

  protected

  def update_ticket_balance
    balance = TicketBalance.first_or_create(
      ticket_id: ticket_id,
      owed_by_id: payer.id,
    )

  end
end
