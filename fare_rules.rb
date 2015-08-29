require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "fare_rules.json"

source.fare_rules.each do |s|
  h = Hash.new
  h[:fare_id] = s.fare_id
  h[:route_id] = s.route_id
  h[:origin_id] = s.origin_id
  h[:destination_id] = s.destination_id.to_i
  h[:contains_id] = s.contains_id
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
