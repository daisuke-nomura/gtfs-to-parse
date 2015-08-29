require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "stops.json"

source.stops.each do |s|
  h = Hash.new
  h[:stop_id] = s.id
  h[:stop_code] = s.code
  h[:stop_name] = s.name
  h[:stop_desc] = s.desc
  h[:stop_latlon] = Parse::GeoPoint.new({
                                       'latitude' => s.lat.to_f,
                                        'longitude' => s.lon.to_f
                                   })
  h[:zone_id] = s.zone_id
  h[:stop_url] = s.url
  h[:location_type] = s.location_type.to_i
  h[:parent_station] = s.parent_station.to_i
  h[:stop_timezone] = s.timezone
  h[:wheelchair_boarding] = s.wheelchair_boarding.to_i
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
