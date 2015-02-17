class User < ActiveRecord::Base
  has_many :item_payments, class_name: 'TicketItemPayer', foreign_key: :payer_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :name, presence: true

  def percentage_for_item(item, default=0.0)
    percentage = item_payments.where(item_id: item.id).first.try(:percentage)
    (percentage || default).to_f
  end
end
