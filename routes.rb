require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "routes.json"

source.routes.each do |s|
  h = Hash.new
  h[:route_id] = s.id
  h[:agency_id] = s.agency_id
  h[:route_short_name] = s.short_name
  h[:route_long_name] = s.long_name
  h[:route_desc] = s.desc
  h[:route_type] = s.type.to_i
  h[:route_url] = s.url
  h[:route_color] = s.color
  h[:route_text_color] = s.text_color
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
