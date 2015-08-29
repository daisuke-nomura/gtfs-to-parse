require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "calendar_dates.json"

source.calendar_dates.each do |s|
  h = Hash.new
  h[:service_id] = s.service_id
  h[:date] = s.date
  h[:date_num] = s.date.to_i
  h[:exception_type] = s.exception_type.to_i
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
