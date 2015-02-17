class TicketsController < ApplicationController
  before_action :set_ticket, only: [:assign, :show, :edit, :update, :destroy]
  add_breadcrumb "Tickets", :tickets_path

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    add_breadcrumb "Ticket from #{@ticket.company}", ticket_path(@ticket)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to assign_ticket_path(@ticket), notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign
    if request.post?
      a = ""
      params.each do |key, value|
        next unless key =~ /^t/

        ignore, item_id, user_id = key.split(/[t_]/)

        t = TicketItemPayer.find_or_initialize_by(
          item_id: item_id,
          payer_id: user_id,
        )

        t.percentage = value.to_f/100
        t.guessed = false
        t.save!
      end

      @ticket.reviewed!

      redirect_to ticket_path(@ticket)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(
      :category,
      :company,
      :paid_by_id,
      :reviewed,
      items_attributes: [
        :id,
        :description,
        :amount_cents,
        :_destroy,
      ])
  end
end
