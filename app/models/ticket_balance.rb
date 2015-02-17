class TicketBalance < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :owed_by
end
