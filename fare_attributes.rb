require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "fare_attributes.json"

source.fare_attributes.each do |s|
  h = Hash.new
  h[:fare_id] = s.fare_id
  h[:price] = s.price.to_f
  h[:currency_type] = s.currency_type
  h[:payment_method] = s.payment_method.to_i
  h[:transfers] = s.transfers.to_i
  h[:transfer_duration] = s.transfer_duration.to_i
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
