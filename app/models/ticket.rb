class Ticket < ActiveRecord::Base
  belongs_to :paid_by, class_name: 'User'
  has_many :items, class_name: 'TicketItem'
  accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true
  has_one :payment, dependent: :destroy
  has_many :dues, as: :due_from, dependent: :destroy

  validates :category, :company, :paid_by_id, presence: true

  after_create :record_payment
  after_update :update_payment

  def total
    items.inject(0) { |mem, var| var.amount + mem }
  end

  def total_for(user)
    items.inject(0) { |mem, item| item.total_for(user) + mem }
  end

  def reviewed!
    TicketDuesGenerationService.new(self).generate!
    update_attributes!(reviewed: true)
  end

  def settled?
    !dues.where(payment_id: nil).exists?
  end

  protected

  def record_payment
    Payment.create(
      ticket_id: id,
      paid_by_id: paid_by_id,
      amount: total,
    )
  end

  def update_payment
    payment.update_attributes(
      paid_by_id: paid_by_id,
      amount: total,
    ) if payment
  end
end
