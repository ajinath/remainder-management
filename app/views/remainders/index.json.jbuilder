json.array!(@remainders) do |remainder|
  json.extract! remainder, :id, :name, :start_date, :end_date, :remainder_time, :schedule_interval, :message, :group_id, :status
  json.url remainder_url(remainder, format: :json)
end
