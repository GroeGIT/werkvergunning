json.array!(@enquirys) do |enquiry|
  json.extract! enquiry, :id, :reference, :description, :location, :amount, :time, :date
  json.url pet_url(enquiry, format: :json)
end
