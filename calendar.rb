require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "calendar.json"

source.calendars.each do |s|
  h = Hash.new
  h[:service_id] = s.service_id
  h[:monday] = s.monday.to_i
  h[:tuesday] = s.tuesday.to_i
  h[:wednesday] = s.wednesday.to_i
  h[:thursday] = s.thursday.to_i
  h[:friday] = s.friday.to_i
  h[:saturday] = s.saturday.to_i
  h[:sunday] = s.sunday.to_i
  h[:start_date] = s.start_date
  h[:start_date_num] = s.start_date.to_i
  h[:end_date] = s.end_date
  h[:end_date_num] = s.end_date.to_i
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
