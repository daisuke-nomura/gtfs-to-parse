require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "agency.json"

source.agencies.each do |s|
  h = Hash.new
  h[:agency_id] = s.id
  h[:agency_name] = s.name
  h[:agency_url] = s.url
  h[:agency_timezone] = s.timezone
  h[:agency_lang] = s.lang
  h[:agency_phone] = s.phone
  h[:agency_fare_url] = s.fare_url
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
