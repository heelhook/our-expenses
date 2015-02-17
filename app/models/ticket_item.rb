class TicketItem < ActiveRecord::Base
  belongs_to :ticket, dependent: :destroy
  has_many :payers, class_name: 'TicketItemPayer', foreign_key: :item_id

  monetize :amount_cents

  delegate :paid_by, to: :ticket, prefix: false

  def total_for(user)
    percentage = payers.where(payer_id: user.id).first.try(:percentage).to_f
    amount * percentage
  end
end
