require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "trips.json"

source.trips.each do |s|
  h = Hash.new
  h[:route_id] = s.route_id
  h[:service_id] = s.service_id
  h[:trip_id] = s.id
  h[:trip_headsign] = s.headsign
  h[:trip_short_name] = s.short_name
  h[:direction_id] = s.direction_id
  h[:block_id] = s.block_id
  h[:shape_id] = s.shape_id
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
