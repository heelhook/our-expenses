class Expense < ActiveRecord::Base
  has_many :dues, as: :due_from
  validates :category, :company, :amount_cents, presence: true

  monetize :amount_cents
end
