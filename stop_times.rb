require 'gtfs'
require 'json'
require 'parse-ruby-client'
require '../rb/util'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "stop_times.json"

source.stop_times.each do |s|
  h = Hash.new
  h[:trip_id] = s.trip_id
  h[:arrival_time] = s.arrival_time
  h[:arrival_time_unixtime] = timeToNum(s.arrival_time)
  h[:departure_time] = s.departure_time
  h[:departure_time_unixtime] = timeToNum(s.departure_time)
  h[:stop_id] = s.stop_id
  h[:stop_sequence] = s.stop_sequence.to_i
  h[:stop_headsign] = s.stop_headsign
  h[:pickup_type] = s.pickup_type.to_i
  h[:drop_off_type] = s.drop_off_type.to_i
  h[:shape_dist_traveled] = s.shape_dist_traveled.to_f
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
