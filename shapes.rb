require 'gtfs'
require 'json'
require 'parse-ruby-client'

results = []
source = GTFS::Source.build('google_transit.zip')
file = "shapes.json"

source.shapes.each do |s|
  h = Hash.new
  h[:shape_id] = s.id
  h[:shape_pt_latlon] = Parse::GeoPoint.new({
                                       'latitude' => s.pt_lat.to_f,
                                       'longitude' => s.pt_lon.to_f
                                   })
  h[:shape_pt_sequence] = s.pt_sequence.to_i
  h[:shape_dist_traveled] = s.dist_traveled.to_f
  results << h
end

data = "{ \"results\": " + results.to_json + "}"
File.write(file, data)
