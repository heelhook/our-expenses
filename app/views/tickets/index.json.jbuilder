json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :category, :company, :paid_by_id, :reviewed, :total
  json.url ticket_url(ticket, format: :json)
end
