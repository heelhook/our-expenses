class TicketDuesGenerationService
  attr_reader :ticket

  def initialize(ticket)
    @ticket = ticket
  end

  def generate!
    User.all.each do |user|
      next if @ticket.paid_by_id == user.id

      due = @ticket.dues.find_or_initialize_by(due_by_id: user.id)
      due.due_to = @ticket.paid_by
      due.amount_cents = @ticket.total_for(user).cents
      due.save!
    end
  end
end
